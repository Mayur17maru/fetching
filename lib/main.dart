import 'dart:core';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:translator/translator.dart';
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
  GoogleTranslator translator= GoogleTranslator();
  // late final ttle;
  List<Article> articles=[];

  void translate(){
    translator.translate( txt,from: 'en',to: 'hi').then((output) {
      setState(() {
        txt=output ;
        appp=txt;
        if (kDebugMode) {
          print(txt);
        }
      });
    });
  }
  bool tt=true;
  late var txt;
  late var appp;
  Future getWebsiteData() async {
    // int bgChapterNum = i;
    // int bgShlokaNum = j;
    // int bgCantoNum=k;
    String? Translation="";
    String? Purport="";
    final url=Uri.parse('https://vedabase.io/en/library/bg/3/1/');
    print(url);
    final response= await http.get(url);
    dom.Document html=dom.Document.html(response.body);
    final ttle=html
        .querySelectorAll(' #content > div ')
        .map((e) => e.text)
        .map((e) => e.replaceAll('<br>', '\n'))
        .toString();
    // String? title=extractData(ttle, "(", "Devanagari");
    // String? Devanagri = extractData(ttle, "Devanagari", " Text");
    // String? Text = extractData(ttle, "Text", " Synonyms");
    // String? Synonyms = extractData(ttle, "Synonyms", " Translation");
    // Purport = extractData(ttle, "Purport", " )");
    // if(Purport==null){
    //   Translation = extractData(ttle, "Translation", " )");
    //   Purport="No Purport";
    // }
    // else{
    //   Translation = extractData(ttle, "Translation", " Purport");
    // }
    setState(() {
      articles=List.generate(ttle.length,
              (index) => Article(
                titles: ttle.replaceAll("  ", "").replaceAll("\n", ""),
                // devnagri: Devanagri?.replaceAll("  ", "").replaceAll("\n", "").replaceAll(" ।", "।\n"),
                // verse_text: Text?.replaceAll("  ", "").replaceAll("\n", ""),
                // translation_title: Synonyms?.replaceAll("  ", "").replaceAll("\n", ""),
                // translation: Translation?.replaceAll("  ", "").replaceAll("\n", ""),
                // // purput_tile: purpot_title,
                // purpot: Purport?.replaceAll("  ", "").replaceAll("\n\n\n", ""),
          ));
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWebsiteData();
  }
  void dispose() {
    // TODO: implement dispose
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
      body:ListView.builder(itemCount:articles.length>1?1:articles.length,itemBuilder: (context,index){
        final article=articles[index];
        txt=article.titles;
        return ListBody(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: tt ? Text(txt,style: TextStyle(fontSize: 25,fontWeight:FontWeight.w700),
                textAlign: TextAlign.center,): Text(appp,style: TextStyle(fontSize: 25,fontWeight:FontWeight.w700),
                textAlign: TextAlign.center,),
            ),ElevatedButton(onPressed: (){
              setState(() {
                translate();
                tt=false;
              });
            }, child: Text('Hindi')),
            SizedBox(
              height: 10,
            ),
            Text("Devanagri",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Text(article.devnagri!,style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),textAlign: TextAlign.center,),
            ),
            SizedBox(
              height: 10,
            ),
            Text("",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Text(article.verse_text!,style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500),textAlign: TextAlign.center,),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Synonyms",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              // child: Text(article.translation_title!,style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500),textAlign: TextAlign.justify,),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Translation",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              // child: Text(article.translation!,style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500),textAlign: TextAlign.justify,),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Purport",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              // child: Text(article.purpot!,style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500),textAlign: TextAlign.justify,),
            ),
          ],
        );

      }),

    );
  }
}

class Article {
  late final String? titles;
  // late final String? devnagri;
  // late final String? verse_text;
  // late final String? translation_title;
  // late final String? translation;
  // // late final String? purput_tile;
  // late final String? purpot;
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
class Data{

}