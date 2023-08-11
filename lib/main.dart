import 'dart:core';

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
  int _counter = 0;

  List<Article> articles=[];
  @override
  void initState(){
    super.initState();
    getWebsiteData(1,9);
  }

  Future getWebsiteData(int i,int j) async {
    int bgChapterNum = i;
    int bgShlokaNum = j;
    final url=Uri.parse("https://vedabase.io/en/library/bg/$bgChapterNum/$bgShlokaNum/");
    final response= await http.get(url);
    dom.Document html=dom.Document.html(response.body);
    final ttle=html
        .querySelectorAll(' #content >div ')
        .map((e) => e.text.replaceAll('  ', '').trim().replaceAll('\n\n\n','\n').replaceAll('\n\n\n\n','\n'))
    .map((e) => e.replaceAll('<br>', '\n'))
        .toString();
    // final devnagri=html
    //     .querySelectorAll(' #bb567941')
    //     .map((e) => e.innerHtml.replaceAll('<br>','\n'))
    //     .toString();
    // final verse_text=html
    //     .querySelectorAll(' #bb510 > em > em')
    //     .map((e) => e.innerHtml.replaceAll('<br>','\n'))
    //     .toString();
    // final translation_title=html
    //     .querySelectorAll('div.wrapper-translation > h2')
    //     .map((e) => e.innerHtml.replaceAll('<br>','\n'))
    //     .toString();
    // final translation=html
    //     .querySelectorAll(' #bb512 > p > strong ')
    //     .map((e) => e.innerHtml.replaceAll('<br>','\n'))
    //     .toString();
    // final purpot_title=html
    //     .querySelectorAll(' div.wrapper-puport > h2')
    //     .map((e) => e.innerHtml.replaceAll('<br>','\n'))
    //     .toString();
    // final purpot=html
    //     .querySelectorAll(' #bb513 >p ')
    //     .map((e) => e.innerHtml.replaceAll('<br>','\n').replaceAll('<em>', ' ').replaceAll('</em>', ' ').replaceAll('(', '').replaceAll(')', ''))
    //     .toString();
    // String output=ttle+devnagri+verse_text+translation_title+translation+purpot_title+purpot;
    // var futureout=Future.value(output);
    // print(ttle+devnagri+verse_text+translation_title+translation+purpot_title+purpot);
    // print('Count: ${devnagri.length}');
    // for(final title in devnagri){
    //   debugPrint(title);
    // }
    setState(() {
      articles=List.generate(ttle.length,
              (index) => Article(
            titles: ttle,
            // devnagri: devnagri,
            // verse_text: verse_text,
            // translation_title: translation_title,
            // translation: translation,
            // purput_tile: purpot_title,
            // purpot: purpot,
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:ListView.builder(itemCount: 1,itemBuilder: (context,index){
        final article=articles[index];
        return ListBody(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article.titles,textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            SizedBox(height: 30,),
            // Text(article.devnagri,textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.w400,fontSize: 20)),
            // SizedBox(height: 30,),
            // Text(article.verse_text,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
            // SizedBox(height: 30,),
            // Text(article.translation_title,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            // SizedBox(height: 20,),
            // Text(article.translation,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            // SizedBox(height: 30,),
            // Text(article.purput_tile,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            // SizedBox(height: 20,),
            // Text(article.purpot,textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          ],
        );

      }),

    );
  }
}

class Article {
  late final String titles;
  late final String devnagri;
  late final String verse_text;
  late final String translation_title;
  late final String translation;
  late final String purput_tile;
  late final String purpot;
  Article({
    required this.titles,
    // required this.devnagri,
    // required this.verse_text,
    // required this.translation_title,
    // required this.translation,
    // required this.purput_tile,
    // required this.purpot,
  });
}
