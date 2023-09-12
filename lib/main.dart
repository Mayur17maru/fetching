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
  // String? extractData(String input, String startWord, String endWord) {
  //   final startIndex = input.indexOf(startWord);
  //   final endIndex = input.indexOf(endWord, startIndex + startWord.length);
  //
  //   if (startIndex != -1 && endIndex != -1) {
  //     final extractedData = input.substring(startIndex + startWord.length, endIndex);
  //     return extractedData;
  //   } else {
  //     return null; // Start or end word not found
  //   }
  // }
  // String? getUrlString(int a,int b){
  //   String Uurl='';
  //   if(a == 1 && b >= 16 && b <= 18){
  //   Uurl='https://vedabase.io/en/library/bg/1/16-18/';
  //   }
  //   else if(a == 1 && b >= 21 && b <= 22){
  //     Uurl='https://vedabase.io/en/library/bg/1/21-22/';
  //   }
  //   else if(a == 1 && b >= 32 && b <= 35){
  //     Uurl='https://vedabase.io/en/library/bg/1/32-35/';
  //   }
  //   else if(a == 1 && b >= 37 && b <= 38){
  //     Uurl='https://vedabase.io/en/library/bg/1/37-38/';
  //   }
  //   else if(a == 2 && b >= 42 && b <= 43){
  //     Uurl='https://vedabase.io/en/library/bg/2/42-43/';
  //   }
  //   else if(a == 5 && b >= 8 && b <= 9){
  //     Uurl='https://vedabase.io/en/library/bg/5/8-9/';
  //   }
  //   else if(a == 5 && b >= 27 && b <= 28){
  //     Uurl='https://vedabase.io/en/library/bg/5/27-28/';
  //   }
  //   else if(a == 6 && b >= 11 && b <= 12){
  //     Uurl='https://vedabase.io/en/library/bg/6/11-12/';
  //   }
  //   else if(a == 6 && b >= 13 && b <= 14){
  //     Uurl='https://vedabase.io/en/library/bg/6/13-14/';
  //   }
  //   else if(a == 6 && b >= 20 && b <= 23){
  //     Uurl='https://vedabase.io/en/library/bg/6/20-23/';
  //   }
  //   else if(a == 10 && b >= 4 && b <= 5){
  //     Uurl='https://vedabase.io/en/library/bg/10/4-5/';
  //   }
  //   else if(a == 10 && b >= 12 && b <= 13){
  //     Uurl='https://vedabase.io/en/library/bg/10/12-13/';
  //   }
  //   else if(a == 11 && b >= 10 && b <= 11){
  //     Uurl='https://vedabase.io/en/library/bg/11/10-11/';
  //   }
  //   else if(a == 11 && b >= 26 && b <= 27){
  //     Uurl='https://vedabase.io/en/library/bg/11/26-27/';
  //   }
  //   else if(a == 11 && b >= 41 && b <= 42){
  //     Uurl='https://vedabase.io/en/library/bg/11/41-42/';
  //   }
  //   else if(a == 12 && b >= 3 && b <= 4){
  //     Uurl='https://vedabase.io/en/library/bg/12/3-4/';
  //   }
  //   else if(a == 12 && b >= 6 && b <= 7){
  //     Uurl='https://vedabase.io/en/library/bg/12/6-7/';
  //   }
  //   else if(a == 12 && b >= 13 && b <= 14){
  //     Uurl='https://vedabase.io/en/library/bg/12/13-14/';
  //   }
  //   else if(a == 12 && b >= 18 && b <= 19){
  //     Uurl='https://vedabase.io/en/library/bg/12/18-19/';
  //   }
  //   else if(a == 13 && b >= 1 && b <= 2){
  //     Uurl='https://vedabase.io/en/library/bg/13/1-2/';
  //   }
  //   else if(a == 13 && b >= 6 && b <= 7){
  //     Uurl='https://vedabase.io/en/library/bg/13/6-7/';
  //   }
  //   else if(a == 13 && b >= 8 && b <= 12){
  //     Uurl='https://vedabase.io/en/library/bg/13/8-12/';
  //   }
  //   else if(a == 14 && b >= 22 && b <= 25){
  //     Uurl='https://vedabase.io/en/library/bg/14/22-25/';
  //   }
  //   else if(a == 15 && b >= 3 && b <= 4){
  //     Uurl='https://vedabase.io/en/library/bg/15/3-4/';
  //   }
  //   else if(a == 16 && b >= 1 && b <= 3){
  //     Uurl='https://vedabase.io/en/library/bg/16/1-3/';
  //   }
  //   else if(a == 16 && b >= 11 && b <= 12){
  //     Uurl='https://vedabase.io/en/library/bg/16/11-12/';
  //   }
  //   else if(a == 16 && b >= 13 && b <= 15){
  //     Uurl='https://vedabase.io/en/library/bg/16/13-15/';
  //   }
  //   else if(a == 17 && b >= 5 && b <= 6){
  //     Uurl='https://vedabase.io/en/library/bg/17/5-6/';
  //   }
  //   else if(a == 17 && b >= 26 && b <= 27){
  //     Uurl='https://vedabase.io/en/library/bg/17/26-27/';
  //   }
  //   else if(a == 18 && b >= 51 && b <= 53){
  //     Uurl='https://vedabase.io/en/library/bg/18/51-53/';
  //   }
  //   else{
  //   Uurl='https://vedabase.io/en/library/bg/a/b/';
  //   }
  //   return Uurl;
  // }
  // Future getWebsiteData(int i,int j) async {
  //   int bgChapterNum = i;
  //   int bgShlokaNum = j;
  //   if(bgChapterNum<10 && bgShlokaNum<10){
  //     Finalurl="https://www.holy-bhagavad-gita.org/public/audio/00${bgChapterNum}_00$bgShlokaNum.mp3";
  //   }
  //   else if(bgChapterNum>10 && bgShlokaNum>10){
  //     Finalurl="https://www.holy-bhagavad-gita.org/public/audio/0${bgChapterNum}_0$bgShlokaNum.mp3";
  //   }
  //   else if(bgChapterNum<10 && bgShlokaNum>10){
  //     Finalurl="https://www.holy-bhagavad-gita.org/public/audio/00${bgChapterNum}_0$bgShlokaNum.mp3";
  //   }
  //   else{
  //     Finalurl="https://www.holy-bhagavad-gita.org/public/audio/0${bgChapterNum}_00$bgShlokaNum.mp3";
  //   }
  //   print(Finalurl);
  //   final url=Uri.parse(getUrlString(bgChapterNum, bgShlokaNum)!);
  //   final response= await http.get(url);
  //   dom.Document html=dom.Document.html(response.body);
  //   final ttle=html
  //       .querySelectorAll(' #content >div ')
  //       .map((e) => e.text)
  //       .map((e) => e.replaceAll('<br>', '\n'))
  //       .toString();
  //   final purpot=html
  //       .querySelectorAll(' #content > div > div.wrapper-puport')
  //       .map((e) => e.innerHtml)
  //       .map((e) => e.replaceAll('<br>', '\n'))
  //       .toString();
  //   String? title=extractData(ttle, "(", "Devanagari");
  //   String? Devanagri = extractData(ttle, "Devanagari", " Text");
  //   String? Text = extractData(ttle, "Text", " Synonyms");
  //   String? Synonyms = extractData(ttle, "Snonyms", " Translation");
  //   String? Translation = extractData(ttle, "Translation", " Purport");
  //   String? Purport = extractData(purpot, "Purport", " )");
  //   print(purpot);
  //   setState(() {
  //     articles=List.generate(ttle.length,
  //             (index) => Article(
  //           titles: title?.replaceAll("  ", "").replaceAll("\n", ""),
  //           devnagri: Devanagri?.replaceAll("  ", "").replaceAll("\n", "").replaceAll(" ।", "।\n").replaceAll(" ।।", " ।। \n"),
  //           verse_text: Text?.replaceAll("  ", "").replaceAll("\n", ""),
  //           translation_title: Synonyms?.replaceAll("  ", "").replaceAll("\n", ""),
  //           translation: Translation?.replaceAll("  ", "").replaceAll("\n", ""),
  //           purpot: Purport?.replaceAll("  ", "").replaceAll("\n", ""),
  //         ));
  //   });
  // }
  Future getWebsiteDataPart(int i, int j) async {
    String Url="https://vedabase.io/en/library/rkd/$i/$j/";
    final url=Uri.parse(Url);
    final response= await http.get(url);
    dom.Document html=dom.Document.html(response.body);
    final ttle=html
        .querySelectorAll('#content > div')
        .map((e) => e.text)
        .map((e) => e.replaceAll('<br>', '\n'))
        .toString();
   print(ttle);
    setState(() {
          articles=List.generate(ttle.length,
                  (index) => Article(
                titles: ttle.replaceAll('(', ''),
              ));
        });
  }
  Future getWebsiteDataAppendx(String Url) async {
    final url=Uri.parse(Url);
    final response= await http.get(url);
    dom.Document html=dom.Document.html(response.body);
    final ttle=html
        .querySelectorAll('#content > div')
        .map((e) => e.text)
        .map((e) => e.replaceAll('<br>', '\n'))
        .toString();
    print(ttle);
    setState(() {
      articles=List.generate(ttle.length,
              (index) => Article(
            titles: ttle,
          ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getWebsiteDataPart(2,5);
    getWebsiteDataAppendx("https://vedabase.io/en/library/rkd/appendix-1-story-of-tiver-ganges/");
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article.titles!,style: TextStyle(fontSize: 20,fontWeight:FontWeight.w700),textAlign: TextAlign.justify,),
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
    // required this.devnagri,
    // required this.verse_text,
    // required this.translation_title,
    // required this.translation,
    // // required this.purput_tile,
    // required this.purpot,
  });
}