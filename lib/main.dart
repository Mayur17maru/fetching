import 'dart:core';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  List<Article> articles=[];
  String? extractData(String input, String startWord, String endWord) {
    final startIndex = input.indexOf(startWord);
    final endIndex = input.indexOf(endWord, startIndex + startWord.length);

    if (startIndex != -1 && endIndex != -1) {
      final extractedData = input.substring(startIndex + startWord.length, endIndex);
      return extractedData;
    } else {
      return null; // Start or end word not found
    }
  }
  Future getWebsiteData(int i,int j) async {
    int bgChapterNum = i;
    int bgShlokaNum = j;
    if(bgChapterNum<10 && bgShlokaNum<10){
      Finalurl="https://www.holy-bhagavad-gita.org/public/audio/00${bgChapterNum}_00$bgShlokaNum.mp3";
    }
    else if(bgChapterNum>10 && bgShlokaNum>10){
      Finalurl="https://www.holy-bhagavad-gita.org/public/audio/0${bgChapterNum}_0$bgShlokaNum.mp3";
    }
    else if(bgChapterNum<10 && bgShlokaNum>10){
      Finalurl="https://www.holy-bhagavad-gita.org/public/audio/00${bgChapterNum}_0$bgShlokaNum.mp3";
    }
    else{
      Finalurl="https://www.holy-bhagavad-gita.org/public/audio/0${bgChapterNum}_00$bgShlokaNum.mp3";
    }
    print(Finalurl);
    final url=Uri.parse("https://vedabase.io/en/library/bg/$bgChapterNum/$bgShlokaNum/");
    final response= await http.get(url);
    dom.Document html=dom.Document.html(response.body);
    final ttle=html
        .querySelectorAll(' #content >div ')
        .map((e) => e.text)
        .map((e) => e.replaceAll('<br>', '\n'))
        .toString();
    String? title=extractData(ttle, "(", "Devanagari");
    String? Devanagri = extractData(ttle, "Devanagari", " Text");
    String? Text = extractData(ttle, "Text", " Synonyms");
    String? Synonyms = extractData(ttle, "Synonyms", " Translation");
    String? Translation = extractData(ttle, "Translation", " Purport");
    String? Purport = extractData(ttle, "Purport", " )");
    print(title);
    setState(() {
      articles=List.generate(ttle.length,
              (index) => Article(
            titles: title?.replaceAll("  ", "").replaceAll("\n", ""),
            devnagri: Devanagri?.replaceAll("  ", "").replaceAll("\n", "").replaceAll(" ।", "।\n"),
            verse_text: Text?.replaceAll("  ", "").replaceAll("\n", ""),
            translation_title: Synonyms?.replaceAll("  ", "").replaceAll("\n", ""),
            translation: Translation?.replaceAll("  ", "").replaceAll("\n", ""),
            // purput_tile: purpot_title,
            purpot: Purport?.replaceAll("  ", "").replaceAll("\n", ""),
          ));
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWebsiteData(15,6);
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    super.dispose();}
  String Finalurl="";
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:ListView.builder(itemCount:(articles.length/articles.length).toInt(),itemBuilder: (context,index){
        final article=articles[index];
        return ListBody(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(article.titles!,textAlign: TextAlign.center
                ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Container(
              alignment: Alignment.center,

              child:
              CircleAvatar(
                radius: 35,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  iconSize: 50,
                  onPressed: () async {
                    if(isPlaying){
                      await audioPlayer.pause();
                    }else{
                      String url = Finalurl;
                      await audioPlayer.play(UrlSource(url));
                    }
                  },
                ),
              ),),
            SizedBox(
              height: 10,
            ),
            Text("Devanagri",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(article.devnagri!,textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.w400,fontSize: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Text",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(article.verse_text!,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Synonyms",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(article.translation_title!,textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Translation",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(article.translation!,textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Purport",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(article.purpot!,textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            ),
          ],
        );

      }),

    );
  }
}

class Article {
  late final String? titles;
  late final String? devnagri;
  late final String? verse_text;
  late final String? translation_title;
  late final String? translation;
  // late final String? purput_tile;
  late final String? purpot;
  Article({
    required this.titles,
    required this.devnagri,
    required this.verse_text,
    required this.translation_title,
    required this.translation,
    // required this.purput_tile,
    required this.purpot,
  });
}