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
  String? getUrlString(int a,int b,int c) {
    String Uurl = '';
    if (a == 1 ){
      if(b == 2 && c >= 28 && c <= 29) {
      Uurl = 'https://vedabase.io/en/library/sb/1/2/28-29/';
    }
    else if (b == 4 && c >= 17 && c <= 18) {
      Uurl = 'https://vedabase.io/en/library/sb/1/4/17-18/';
    }
    else if (b == 4 && c >= 28 && c <= 29) {
      Uurl = 'https://vedabase.io/en/library/sb/1/4/28-29/';
    }
    else if (b == 7 && c >= 13 && c <= 14) {
      Uurl = 'https://vedabase.io/en/library/sb/1/7/13-14/';
    }
    else if (b == 7 && c >= 53 && c <= 54) {
      Uurl = 'https://vedabase.io/en/library/sb/1/7/53-54/';
    }
    else if (b == 9 && c >= 6 && c <= 7) {
      Uurl = 'https://vedabase.io/en/library/sb/1/9/6-7/';
    }
    else if (b == 10 && c >= 9 && c <= 10) {
      Uurl = 'https://vedabase.io/en/library/sb/1/10/9-10/';
    }
    else if (b == 10 && c >= 11 && c <= 12) {
      Uurl = 'https://vedabase.io/en/library/sb/1/10/11-12/';
    }
    else if (b == 10 && c >= 34 && c <= 35) {
      Uurl = 'https://vedabase.io/en/library/sb/1/10/34-35/';
    }
    else if (b == 11 && c >= 4 && c <= 5) {
      Uurl = 'https://vedabase.io/en/library/sb/1/11/4-5/';
    }
    else if (b == 11 && c >= 16 && c <= 17) {
      Uurl = 'https://vedabase.io/en/library/sb/1/11/16-17/';
    }
    else if (b == 13 && c >= 3 && c <= 4) {
      Uurl = 'https://vedabase.io/en/library/sb/1/13/3-4/';
    }
    else if (b == 14 && c >= 28 && c <= 29) {
      Uurl = 'https://vedabase.io/en/library/sb/1/14/28-29/';
    }
    else if (b == 14 && c >= 32 && c <= 33) {
      Uurl = 'https://vedabase.io/en/library/sb/1/14/32-33/';
    }
    else if (b == 14 && c >= 35 && c <= 36) {
      Uurl = 'https://vedabase.io/en/library/sb/1/14/35-36/';
    }
    else if (b == 15 && c >= 22 && c <= 23) {
      Uurl = 'https://vedabase.io/en/library/sb/1/15/22-23/';
    }
    else if (b == 15 && c >= 25 && c <= 26) {
      Uurl = 'https://vedabase.io/en/library/sb/1/15/25-26/';
    }
    else if (b == 15 && c >= 47 && c <= 48) {
      Uurl = 'https://vedabase.io/en/library/sb/1/15/47-48/';
    }
    else if (b == 16 && c >= 13 && c <= 15) {
      Uurl = 'https://vedabase.io/en/library/sb/1/16/13-15/';
    }
    else if (b == 16 && c >= 26 && c <= 30) {
      Uurl = 'https://vedabase.io/en/library/sb/1/16/26-30/';
    }
    else if (b == 16 && c >= 32 && c <= 33) {
      Uurl = 'https://vedabase.io/en/library/sb/1/16/32-33/';
    }
    else if (b == 17 && c >= 10 && c <= 11) {
      Uurl = 'https://vedabase.io/en/library/sb/1/17/10-11/';
    }
    else if (b == 17 && c >= 43 && c <= 44) {
      Uurl = 'https://vedabase.io/en/library/sb/1/17/43-44/';
    }
    else if (b == 18 && c >= 24 && c <= 25) {
      Uurl = 'https://vedabase.io/en/library/sb/1/18/24-25/';
    }
    else if (b == 19 && c >= 9 && c <= 10) {
      Uurl = 'https://vedabase.io/en/library/sb/1/19/9-10/';
    }
    else {
        Uurl = 'https://vedabase.io/en/library/sb/1/$b/$c/';
      }
  }
     else if(a==2){
        if(b==3 && c>=2 && c<=7){
          Uurl='https://vedabase.io/en/library/sb/2/3/2-7/';
     }
        else if(b==4 && c>=3 && c<=4){
          Uurl='https://vedabase.io/en/library/sb/2/4/3-4/';
        }
        else if(b==5 && c>=26 && c<=29){
          Uurl='https://vedabase.io/en/library/sb/2/5/26-29/';
        }
        else if(b==5 && c>=40 && c<=41){
          Uurl='https://vedabase.io/en/library/sb/2/5/40-41/';
        }
        else if(b==6 && c>=13 && c<=16){
          Uurl='https://vedabase.io/en/library/sb/2/6/13-16/';
        }
        else if(b==6 && c>=40 && c<=41){
          Uurl='https://vedabase.io/en/library/sb/2/6/40-41/';
        }
        else if(b==6 && c>=43 && c<=45){
          Uurl='https://vedabase.io/en/library/sb/2/6/43-45/';
        }
        else if(b==7 && c>=34 && c<=35){
          Uurl='https://vedabase.io/en/library/sb/2/7/34-35/';
        }
        else if(b==7 && c>=43 && c<=45){
          Uurl='https://vedabase.io/en/library/sb/2/7/43-45/';
        }
        else if(b==10 && c>=37 && c<=40){
          Uurl='https://vedabase.io/en/library/sb/2/10/37-40/';
        }
        else if(b==10 && c>=49 && c<=50){
          Uurl='https://vedabase.io/en/library/sb/2/10/49-50/';
        }
        else {
          Uurl = 'https://vedabase.io/en/library/sb/2/$b/$c/';
        }
     }
    else if(a==3){
      if(b==9 && c>=27 && c<=28){
        Uurl='https://vedabase.io/en/library/sb/3/9/27-28/';
      }
      else if(b==10 && c>=28 && c<=29){
        Uurl='https://vedabase.io/en/library/sb/3/10/28-29/';
      }
      else if(b==14 && c>=44 && c<=45){
        Uurl='https://vedabase.io/en/library/sb/3/14/44-45/';
      }
      else if(b==18 && c>=22 && c<=23){
        Uurl='https://vedabase.io/en/library/sb/3/18/22-23/';
      }
      else if(b==21 && c>=38 && c<=39){
        Uurl='https://vedabase.io/en/library/sb/3/21/38-39/';
      }
      else if(b==21 && c>=42 && c<=43){
        Uurl='https://vedabase.io/en/library/sb/3/21/42-43/';
      }
      else if(b==21 && c>=45 && c<=47){
        Uurl='https://vedabase.io/en/library/sb/3/21/45-47/';
      }
      else if(b==21 && c>=52 && c<=54){
        Uurl='https://vedabase.io/en/library/sb/3/21/52-54)/';
      }
      else if(b==22 && c>=26 && c<=27){
        Uurl='https://vedabase.io/en/library/sb/3/22/26-27/';
      }
      else if(b==22 && c>=29 && c<=30){
        Uurl='https://vedabase.io/en/library/sb/3/22/29-30/';
      }
      else if(b==23 && c>=4 && c<=5){
        Uurl='https://vedabase.io/en/library/sb/3/23/4-5/';
      }
      else if(b==23 && c>=14 && c<=15){
        Uurl='https://vedabase.io/en/library/sb/3/23/14-15)/';
      }
      else if(b==23 && c>=36 && c<=37){
        Uurl='https://vedabase.io/en/library/sb/3/23/36-37/';
      }
      else if(b==24 && c>=22 && c<=23){
        Uurl='https://vedabase.io/en/library/sb/3/24/22-23/';
      }
      else if(b==25 && c>=39 && c<=40){
        Uurl='https://vedabase.io/en/library/sb/3/25/39-40/';
      }
      else if(b==26 && c>=23 && c<=24){
        Uurl='https://vedabase.io/en/library/sb/3/26/23-24/';
      }
      else if(b==27 && c>=28 && c<=29){
        Uurl='https://vedabase.io/en/library/sb/3/27/28-29/';
      }
      else if(b==29 && c>=1 && c<=2){
        Uurl='https://vedabase.io/en/library/sb/3/29/1-2/';
      }
      else if(b==29 && c>=11 && c<=12){
        Uurl='https://vedabase.io/en/library/sb/3/29/11-12/';
      }
      else if(b==31 && c>=45 && c<=46){
        Uurl='https://vedabase.io/en/library/sb/3/31/45-46/';
      }
      else if(b==32 && c>=12 && c<=15){
        Uurl='https://vedabase.io/en/library/sb/3/32/12-15/';
      }
      else if(b==32 && c>=34 && c<=36){
        Uurl='https://vedabase.io/en/library/sb/3/32/34-36/';
      }
      else if(b==33 && c>=24 && c<=25){
        Uurl='https://vedabase.io/en/library/sb/3/33/24-25/';
      }
      else {
        Uurl = 'https://vedabase.io/en/library/sb/3/$b/$c/';
      }
    }
     else if(a==4) {
       if (b == 1 && c >= 26 && c <= 27) {
         Uurl = 'https://vedabase.io/en/library/sb/4/1/26-27/';
       }
       else if (b == 1 && c >= 46 && c <= 47) {
         Uurl = 'https://vedabase.io/en/library/sb/4/1/46-47/';
       }
       else if (b == 1 && c >= 49 && c <= 52) {
         Uurl = 'https://vedabase.io/en/library/sb/4/1/49-52/';
       }
       else if (b == 1 && c >= 54 && c <= 55) {
         Uurl = 'https://vedabase.io/en/library/sb/4/1/54-55/';
       }
       else if (b == 2 && c >= 14 && c <= 15) {
         Uurl = 'https://vedabase.io/en/library/sb/4/2/14-15/';
       }
       else if (b == 3 && c >= 5 && c <= 7) {
         Uurl = 'https://vedabase.io/en/library/sb/4/3/5-7/';
       }
       else if (b == 6 && c >= 1 && c <= 2) {
         Uurl = 'https://vedabase.io/en/library/sb/4/6/1-2/';
       }
       else if (b == 6 && c >= 14 && c <= 15) {
         Uurl = 'https://vedabase.io/en/library/sb/4/6/14-15/';
       }
       else if (b == 6 && c >= 19 && c <= 20) {
         Uurl = 'https://vedabase.io/en/library/sb/4/6/19-20/';
       }
       else if (b == 8 && c >= 59 && c <= 60) {
         Uurl = 'https://vedabase.io/en/library/sb/4/8/59-60/';
       }
       else if (b == 9 && c >= 20 && c <= 21) {
         Uurl = 'https://vedabase.io/en/library/sb/4/9/20-21/';
       }
       else if (b == 9 && c >= 39 && c <= 40) {
         Uurl = 'https://vedabase.io/en/library/sb/4/9/39-40/';
       }
       else if (b == 9 && c >= 42 && c <= 43) {
         Uurl = 'https://vedabase.io/en/library/sb/4/9/42-43/';
       }
       else if (b == 9 && c >= 58 && c <= 59) {
         Uurl = 'https://vedabase.io/en/library/sb/4/9/58-59/';
       }
       else if (b == 10 && c >= 11 && c <= 12) {
         Uurl = 'https://vedabase.io/en/library/sb/4/10/11-12/';
       }
       else if (b == 10 && c >= 18 && c <= 19) {
         Uurl = 'https://vedabase.io/en/library/sb/4/10/18-19/';
       }
       else if (b == 12 && c >= 49 && c <= 50) {
         Uurl = 'https://vedabase.io/en/library/sb/4/12/49-50/';
       }
       else if (b == 13 && c >= 8 && c <= 9) {
         Uurl = 'https://vedabase.io/en/library/sb/4/13/8-9/';
       }
       else if (b == 13 && c >= 15 && c <= 16) {
         Uurl = 'https://vedabase.io/en/library/sb/4/13/15-16/';
       }
       else if (b == 13 && c >= 19 && c <= 20) {
         Uurl = 'https://vedabase.io/en/library/sb/4/13/19-20/';
       }
       else if (b == 13 && c >= 15 && c <= 16) {
         Uurl = 'https://vedabase.io/en/library/sb/4/13/15-16/';
       }
       else if (b == 14 && c >= 26 && c <= 27) {
         Uurl = 'https://vedabase.io/en/library/sb/4/14/26-27/';
       }
       else if (b == 14 && c >= 39 && c <= 40) {
         Uurl = 'https://vedabase.io/en/library/sb/4/14/39-40/';
       }
       else if (b == 15 && c >= 9 && c <= 10) {
         Uurl = 'https://vedabase.io/en/library/sb/4/15/9-10/';
       }
       else if (b == 17 && c >= 6 && c <= 7) {
         Uurl = 'https://vedabase.io/en/library/sb/4/17/6-7/';
       }
       else if (b == 18 && c >= 9 && c <= 10) {
         Uurl = 'https://vedabase.io/en/library/sb/4/18/9-10/';
       }
       else if (b == 18 && c >= 23 && c <= 24) {
         Uurl = 'https://vedabase.io/en/library/sb/4/18/23-24/';
       }
       else if (b == 19 && c >= 24 && c <= 25) {
         Uurl = 'https://vedabase.io/en/library/sb/4/19/24-25/';
       }
       else if (b == 20 && c >= 35 && c <= 36) {
         Uurl = 'https://vedabase.io/en/library/sb/4/20/35-36/';
       }
       else if (b == 21 && c >= 28 && c <= 29) {
         Uurl = 'https://vedabase.io/en/library/sb/4/21/28-29/';
       }
       else if (b == 23 && c >= 1 && c <= 3) {
         Uurl = 'https://vedabase.io/en/library/sb/4/23/1-3/';
       }
       else if (b == 24 && c >= 24 && c <= 25) {
         Uurl = 'https://vedabase.io/en/library/sb/4/24/24-25/';
       }
       else if (b == 24 && c >= 45 && c <= 46) {
         Uurl = 'https://vedabase.io/en/library/sb/4/25/45-46/';
       }
       else if (b == 24 && c >= 47 && c <= 48) {
         Uurl = 'https://vedabase.io/en/library/sb/4/24/47-48/';
       }
       else if (b == 25 && c >= 57 && c <= 61) {
         Uurl = 'https://vedabase.io/en/library/sb/4/25/57-61/';
       }
       else if (b == 26 && c >= 1 && c <= 3) {
         Uurl = 'https://vedabase.io/en/library/sb/4/26/1-3/';
       }
       else if (b == 28 && c >= 35 && c <= 36) {
         Uurl = 'https://vedabase.io/en/library/sb/4/28/35-36/';
       }
       else if (b == 29 && c >= 18 && c <= 20) {
         Uurl = 'https://vedabase.io/en/library/sb/4/29/18-20/';
       }
       else if (b == 29 && c >= 23 && c <= 25) {
         Uurl = 'https://vedabase.io/en/library/sb/4/29/23-25/';
       }
       else if (b == 29 && c >= 26 && c <= 27) {
         Uurl = 'https://vedabase.io/en/library/sb/4/29/26-27/';
       }
       else if (b == 29 && c >= 36 && c <= 37) {
         Uurl = 'https://vedabase.io/en/library/sb/4/29/36-37/';
       }
       else if (b == 29 && c >= 39 && c <= 40) {
         Uurl = 'https://vedabase.io/en/library/sb/4/29/39-40/';
       }
       else if (b == 29 && c >= 42 && c <= 44) {
         Uurl = 'https://vedabase.io/en/library/sb/4/29/42-44/';
       }
       else if (b == 29 && c >= 76 && c <= 77) {
         Uurl = 'https://vedabase.io/en/library/sb/4/29/76-77/';
       }
       else if (b == 29 && c==86) {
         Uurl = 'https://vedabase.io/en/library/sb/4/29/1a-2a/';
       }
       else if (b == 29 && c==87) {
         Uurl = 'https://vedabase.io/en/library/sb/4/29/1b/';
       }
       else if(b==29 && c==88){
         Uurl='https://vedabase.io/en/library/sb/4/29/2b/';
       }
       else if(b==30 && c>=39 && c<=40){
         Uurl='https://vedabase.io/en/library/sb/4/30/39-40/';
       }
       else if(b==30 && c>=50 && c<=51){
         Uurl='https://vedabase.io/en/library/sb/4/30/50-51/';
       }
       else {
         Uurl = 'https://vedabase.io/en/library/sb/4/$b/$c/';
       }
     }
     else if(a==5){
       if(b==3 && c>=4 && c<=5){
         Uurl='https://vedabase.io/en/library/sb/5/3/4-5/';
       }
       else if(b==4 && c>=11 && c<=12){
         Uurl='https://vedabase.io/en/library/sb/5/4/11-12/';
       }
       else if(b==5 && c>10 && c<=13){
         Uurl='https://vedabase.io/en/library/sb/5/5/10-13/';
       }
       else if(b==9 && c>=1 && c<=2){
         Uurl='https://vedabase.io/en/library/sb/5/9/1-2/';
       }
       else if(b==9 && c>=9 && c<=10){
         Uurl='https://vedabase.io/en/library/sb/5/9/9-10/';
       }
       else if(b==11 && c>=13 && c<=14){
         Uurl='https://vedabase.io/en/library/sb/5/11/13-14/';
       }
       else if(b==12 && c>=5 && c<=6){
         Uurl='https://vedabase.io/en/library/sb/5/12/5-6/';
       }
       else if(b==15 && c>=14 && c<=15){
         Uurl='https://vedabase.io/en/library/sb/5/15/14-15/';
       }
       else if(b==16 && c>=13 && c<=14){
         Uurl='https://vedabase.io/en/library/sb/5/16/13-14/';
       }
       else if(b==16 && c>=20 && c<=21){
         Uurl='https://vedabase.io/en/library/sb/5/16/20-21/';
       }
       else if(b==17 && c>=22 && c<=23){
         Uurl='https://vedabase.io/en/library/sb/5/17/22-23/';
       }
       else if(b==19 && c>=17 && c<=18){
         Uurl='https://vedabase.io/en/library/sb/5/19/17-18/';
       }
       else if(b==19 && c>=29 && c<=30){
         Uurl='https://vedabase.io/en/library/sb/5/19/29-30/';
       }
       else if(b==20 && c>=3 && c<=4){
         Uurl='https://vedabase.io/en/library/sb/5/20/3-4/';
       }
       else if(b==21 && c>=8 && c<=9){
         Uurl='https://vedabase.io/en/library/sb/5/21/8-9/';
       }
       else {
         Uurl = 'https://vedabase.io/en/library/sb/5/$b/$c/';
       }
     }
     else if(a==6){
      if(b==1 && c>=4 && c<=5){
       Uurl='https://vedabase.io/en/library/sb/6/1/4-5/';
     }
      else if(b==1 && c>=28 && c<=29){
        Uurl='https://vedabase.io/en/library/sb/6/1/28-29/';
      }
      else if(b==1 && c>=34 && c<=36){
        Uurl='https://vedabase.io/en/library/sb/6/1/34-36/';
      }
      else if(b==1 && c>=56 && c<=57){
        Uurl='https://vedabase.io/en/library/sb/6/1/56-57/';
      }
      else if(b==1 && c>=58 && c<=60){
        Uurl='https://vedabase.io/en/library/sb/6/1/58-60/';
      }
      else if(b==2 && c>=5 && c<=6){
        Uurl='https://vedabase.io/en/library/sb/6/2/5-6/';
      }
      else if(b==2 && c>=9 && c<=10){
        Uurl='https://vedabase.io/en/library/sb/6/2/9-10/';
      }
      else if(b==2 && c>=24 && c<=25){
        Uurl='https://vedabase.io/en/library/sb/6/2/24-25/';
      }
      else if(b==2 && c>=36 && c<=37){
        Uurl='https://vedabase.io/en/library/sb/6/2/36-37/';
      }
      else if(b==2 && c>=47 && c<=48){
        Uurl='https://vedabase.io/en/library/sb/6/2/47-48/';
      }
      else if(b==3 && c>=14 && c<=15){
        Uurl='https://vedabase.io/en/library/sb/6/3/14-15/';
      }
      else if(b==3 && c>=20 && c<=21){
        Uurl='https://vedabase.io/en/library/sb/6/3/20-21/';
      }
      else if(b==4 && c>=27 && c<=28){
        Uurl='https://vedabase.io/en/library/sb/6/4/27-28/';
      }
      else if(b==4 && c>=35 && c<=39){
        Uurl='https://vedabase.io/en/library/sb/6/4/35-39/';
      }
      else if(b==4 && c>=49 && c<=50){
        Uurl='https://vedabase.io/en/library/sb/6/4/49-50/';
      }
      else if(b==5 && c>=4 && c<=5){
        Uurl='https://vedabase.io/en/library/sb/6/5/-48/';
      }
      else if(b==5 && c>=6 && c<=8){
        Uurl='https://vedabase.io/en/library/sb/6/5/6-8/';
      }
      else if(b==5 && c>=27 && c<=28){
        Uurl='https://vedabase.io/en/library/sb/6/5/27-28/';
      }
      else if(b==6 && c>=10 && c<=11){
        Uurl='https://vedabase.io/en/library/sb/6/6/10-11/';
      }
      else if(b==6 && c>=17 && c<=18){
        Uurl='https://vedabase.io/en/library/sb/6/6/17-18/';
      }
      else if(b==6 && c>=21 && c<=22){
        Uurl='https://vedabase.io/en/library/sb/6/6/21-22/';
      }
      else if(b==6 && c>=24 && c<=26){
        Uurl='https://vedabase.io/en/library/sb/6/6/24-26/';
      }
      else if(b==6 && c>=29 && c<=31){
        Uurl='https://vedabase.io/en/library/sb/6/6/29-31/';
      }
      else if(b==6 && c>=33 && c<=36){
        Uurl='https://vedabase.io/en/library/sb/6/6/33-36/';
      }
      else if(b==6 && c>=38 && c<=39){
        Uurl='https://vedabase.io/en/library/sb/6/6/38-39/';
      }
      else if(b==7 && c>=2 && c<=8){
        Uurl='https://vedabase.io/en/library/sb/6/7/2-8/';
      }
      else if(b==7 && c>=29 && c<=30){
        Uurl='https://vedabase.io/en/library/sb/6/7/29-30/';
      }
      else if(b==8 && c>=1 && c<=2){
        Uurl='https://vedabase.io/en/library/sb/6/8/1-2/';
      }
      else if(b==8 && c>=4 && c<=6){
        Uurl='https://vedabase.io/en/library/sb/6/8/4-6/';
      }else if(b==8 && c>=8 && c<=10){
        Uurl='https://vedabase.io/en/library/sb/6/8/8-10/';
      }else if(b==8 && c>=27 && c<=28){
        Uurl='https://vedabase.io/en/library/sb/6/8/27-28/';
      }else if(b==8 && c>=32 && c<=33){
        Uurl='https://vedabase.io/en/library/sb/6/8/32-33/';
      }
      else if(b==9 && c>=13 && c<=17){
        Uurl='https://vedabase.io/en/library/sb/6/9/13-17/';
      }else if(b==9 && c>=26 && c<=27){
        Uurl='https://vedabase.io/en/library/sb/6/9/26-27/';
      }
      else if(b==9 && c>=29 && c<=30){
        Uurl='https://vedabase.io/en/library/sb/6/9/29-30/';
      }
      else if(b==10 && c>=13 && c<=14){
        Uurl='https://vedabase.io/en/library/sb/6/10/13-14/';
      }
      else if(b==10 && c>=17 && c<=18){
        Uurl='https://vedabase.io/en/library/sb/6/10/17-18/';
      }
      else if(b==10 && c>=19 && c<=22){
        Uurl='https://vedabase.io/en/library/sb/6/10/19-22/';
      }
      else if(b==11 && c>=2 && c<=3){
        Uurl='https://vedabase.io/en/library/sb/6/11/2-3/';
      }
      else if(b==12 && c>=27 && c<=29){
        Uurl='https://vedabase.io/en/library/sb/6/12/13-14/';
      }
      else if(b==13 && c>=8 && c<=9){
        Uurl='https://vedabase.io/en/library/sb/6/13/8-9/';
      }
      else if(b==13 && c>=12 && c<=13){
        Uurl='https://vedabase.io/en/library/sb/6/13/12-13/';
      }
      else if(b==13 && c>=19 && c<=20){
        Uurl='https://vedabase.io/en/library/sb/6/13/19-20/';
      }
      else if(b==13 && c>=22 && c<=23){
        Uurl='https://vedabase.io/en/library/sb/6/13/22-23/';
      }
      else if(b==14 && c>=50 && c<=51){
        Uurl='https://vedabase.io/en/library/sb/6/14/50-51/';
      }
      else if(b==15 && c>=12 && c<=15){
        Uurl='https://vedabase.io/en/library/sb/6/15/12-15/';
      }
      else if(b==15 && c>=18 && c<=19){
        Uurl='https://vedabase.io/en/library/sb/6/15/18-19/';
      }
      else if(b==15 && c>=21 && c<=23){
        Uurl='https://vedabase.io/en/library/sb/6/15/21-23/';
      }
      else if(b==16 && c>=18 && c<=19){
        Uurl='https://vedabase.io/en/library/sb/6/16/18-19/';
      }
      else if(b==16 && c>=53 && c<=54){
        Uurl='https://vedabase.io/en/library/sb/6/16/53-54/';
      }
      else if(b==16 && c>=61 && c<=62){
        Uurl='https://vedabase.io/en/library/sb/6/16/61-62/';
      }
      else if(b==17 && c>=2 && c<=3){
        Uurl='https://vedabase.io/en/library/sb/6/17/2-3/';
      }
      else if(b==17 && c>=4 && c<=5){
        Uurl='https://vedabase.io/en/library/sb/6/17/4-5/';
      }
      else if(b==17 && c>=34 && c<=35){
        Uurl='https://vedabase.io/en/library/sb/6/17/34-35/';
      }
      else if(b==18 && c>=3 && c<=4){
        Uurl='https://vedabase.io/en/library/sb/6/18/3-4/';
      }
      else if(b==18 && c>=12 && c<=13){
        Uurl='https://vedabase.io/en/library/sb/6/18/12-13/';
      }
      else if(b==18 && c>=27 && c<=28){
        Uurl='https://vedabase.io/en/library/sb/6/18/27-28/';
      }
      else if(b==18 && c>=33 && c<=34){
        Uurl='https://vedabase.io/en/library/sb/6/18/33-34/';
      }
      else if(b==18 && c>=66 && c<=67){
        Uurl='https://vedabase.io/en/library/sb/6/18/66-67/';
      }
      else if(b==19 && c>=2 && c<=3){
        Uurl='https://vedabase.io/en/library/sb/6/19/2-3/';
      }
      else if(b==19 && c>=19 && c<=20){
        Uurl='https://vedabase.io/en/library/sb/6/19/19-20/';
      }
      else if(b==19 && c>=26 && c<=28){
        Uurl='https://vedabase.io/en/library/sb/6/19/26-28/';
      }
      else {
        Uurl = 'https://vedabase.io/en/library/sb/6/$b/$c/';
      }
     }
    else if(a==7){
       if(b==1 && c>=4 && c<=5){
         Uurl='https://vedabase.io/en/library/sb/7/1/4-5/';
       }
       else if(b==1 && c>=14 && c<=15){
         Uurl='https://vedabase.io/en/library/sb/7/1/14-15/';
       }
       else if(b==1 && c>=28 && c<=29){
         Uurl='https://vedabase.io/en/library/sb/7/1/28-29/';
       }
       else if(b==2 && c>=4 && c<=5){
         Uurl='https://vedabase.io/en/library/sb/7/2/4-5/';
       }
       else if(b==2 && c>=7 && c<=8){
         Uurl='https://vedabase.io/en/library/sb/7/2/7-8/';
       }
       else if(b==2 && c>=18 && c<=19){
         Uurl='https://vedabase.io/en/library/sb/7/2/18-19/';
       }
       else if(b==2 && c>=25 && c<=26){
         Uurl='https://vedabase.io/en/library/sb/7/2/25-26/';
       }
       else if(b==2 && c>=29 && c<=31){
         Uurl='https://vedabase.io/en/library/sb/7/2/29-31/';
       }
       else if(b==3 && c>=9 && c<=10){
         Uurl='https://vedabase.io/en/library/sb/7/3/9-10/';
       }
       else if(b==3 && c>=15 && c<=16){
         Uurl='https://vedabase.io/en/library/sb/7/3/15-16/';
       }
       else if(b==3 && c>=26 && c<=27){
         Uurl='https://vedabase.io/en/library/sb/7/3/26-27/';
       }
       else if(b==3 && c>=37 && c<=38){
         Uurl='https://vedabase.io/en/library/sb/7/3/37-38/';
       }
       else if(b==4 && c>=5 && c<=7){
         Uurl='https://vedabase.io/en/library/sb/7/4/5-7/';
       }
       else if(b==4 && c>=22 && c<=23){
         Uurl='https://vedabase.io/en/library/sb/7/4/22-23/';
       }
       else if(b==4 && c>=25 && c<=26){
         Uurl='https://vedabase.io/en/library/sb/7/4/25-26/';
       }
       else if(b==4 && c>=31 && c<=32){
         Uurl='https://vedabase.io/en/library/sb/7/4/31-32/';
       }
       else if(b==5 && c>=23 && c<=24){
         Uurl='https://vedabase.io/en/library/sb/7/5/23-24/';
       }
       else if(b==5 && c>=39 && c<=40){
         Uurl='https://vedabase.io/en/library/sb/7/5/39-40/';
       }else if(b==5 && c>=43 && c<=44){
         Uurl='https://vedabase.io/en/library/sb/7/5/43-44/';
       }else if(b==5 && c>=56 && c<=57){
         Uurl='https://vedabase.io/en/library/sb/7/5/56-57/';
       }
       else if(b==6 && c>=11 && c<=13){
         Uurl='https://vedabase.io/en/library/sb/7/6/11-13/';
       }
       else if(b==6 && c>=17 && c<=18){
         Uurl='https://vedabase.io/en/library/sb/7/6/17-18/';
       }
       else if(b==6 && c>=20 && c<=23){
         Uurl='https://vedabase.io/en/library/sb/7/6/20-23/';
       }
       else if(b==6 && c>=29 && c<=30){
         Uurl='https://vedabase.io/en/library/sb/7/6/29-30/';
       }
       else if(b==7 && c>=4 && c<=5){
         Uurl='https://vedabase.io/en/library/sb/7/7/4-5/';
       }
       else if(b==7 && c>=19 && c<=20){
         Uurl='https://vedabase.io/en/library/sb/7/7/19-20/';
       }
       else if(b==7 && c>=30 && c<=31){
         Uurl='https://vedabase.io/en/library/sb/7/7/30-31/';
       }
       else if(b==7 && c>=51 && c<=52){
         Uurl='https://vedabase.io/en/library/sb/7/7/51-52/';
       }
       else if(b==8 && c>=3 && c<=4){
         Uurl='https://vedabase.io/en/library/sb/7/8/3-4/';
       }
       else if(b==8 && c>=19 && c<=22){
         Uurl='https://vedabase.io/en/library/sb/7/8/19-22/';
       }
       else if(b==8 && c>=37 && c<=39){
         Uurl='https://vedabase.io/en/library/sb/7/8/37-39/';
       }
       else if(b==10 && c>=15 && c<=17) {
         Uurl = 'https://vedabase.io/en/library/sb/7/10/15-17/';
       }
       else if(b==10 && c>=43 && c<=44) {
         Uurl = 'https://vedabase.io/en/library/sb/7/10/43-44/';
       }
       else if(b==10 && c>=54 && c<=55) {
         Uurl = 'https://vedabase.io/en/library/sb/7/10/54-55/';
       }
       else if(b==10 && c>=65 && c<=66) {
         Uurl = 'https://vedabase.io/en/library/sb/7/10/65-66/';
       }
       else if(b==11 && c>=8 && c<=12) {
         Uurl = 'https://vedabase.io/en/library/sb/7/11/8-12/';
       }
       else if(b==11 && c>=18 && c<=20) {
         Uurl = 'https://vedabase.io/en/library/sb/7/11/18-20/';
       }
       else if(b==11 && c>=26 && c<=27) {
         Uurl = 'https://vedabase.io/en/library/sb/7/11/26-27/';
       }
       else if(b==11 && c>=33 && c<=34) {
         Uurl = 'https://vedabase.io/en/library/sb/7/11/33-34/';
       }
       else if(b==12 && c>=13 && c<=14) {
         Uurl = 'https://vedabase.io/en/library/sb/7/12/13-14/';
       }
       else if(b==12 && c>=26 && c<=28) {
         Uurl = 'https://vedabase.io/en/library/sb/7/12/26-28/';
       }
       else if(b==12 && c>=29 && c<=30) {
         Uurl = 'https://vedabase.io/en/library/sb/7/12/29-30/';
       }
       else if(b==13 && c>=12 && c<=13) {
         Uurl = 'https://vedabase.io/en/library/sb/7/13/12-13/';
       }
       else if(b==14 && c>=3 && c<=4) {
         Uurl = 'https://vedabase.io/en/library/sb/7/14/3-4/';
       }
       else if(b==14 && c>=20 && c<=23) {
         Uurl = 'https://vedabase.io/en/library/sb/7/14/20-23/';
       }
       else if(b==14 && c>=27 && c<=28) {
         Uurl = 'https://vedabase.io/en/library/sb/7/14/27-28/';
       }
       else if(b==14 && c>=30 && c<=33) {
         Uurl = 'https://vedabase.io/en/library/sb/7/14/30-33/';
       }
       else if(b==15 && c>=32 && c<=33) {
         Uurl = 'https://vedabase.io/en/library/sb/7/15/32-33/';
       }
       else if(b==15 && c>=38 && c<=39) {
         Uurl = 'https://vedabase.io/en/library/sb/7/15/38-39/';
       }
       else if(b==15 && c>=43 && c<=44) {
         Uurl = 'https://vedabase.io/en/library/sb/7/15/43-44/';
       }
       else if(b==15 && c>=48 && c<=49) {
         Uurl = 'https://vedabase.io/en/library/sb/7/15/48-49/';
       }
       else if(b==15 && c>=50 && c<=51) {
         Uurl = 'https://vedabase.io/en/library/sb/7/15/50-51/';
       }
       else {
         Uurl = 'https://vedabase.io/en/library/sb/7/$b/$c/';
       }
     }
    else if(a==8){
       if(b==2 && c>=2 && c<=3){
         Uurl='https://vedabase.io/en/library/sb/8/2/2-3/';
       }
       else if(b==2 && c>=9 && c<=13){
         Uurl='https://vedabase.io/en/library/sb/8/2/9-13/';
       }
       else if(b==2 && c>=14 && c<=19){
         Uurl='https://vedabase.io/en/library/sb/8/2/14-19/';
       }
       else if(b==2 && c>=23 && c<=24){
         Uurl='https://vedabase.io/en/library/sb/8/2/23-24/';
       }
       else if(b==3 && c>=8 && c<=9){
         Uurl='https://vedabase.io/en/library/sb/8/3/8-9/';
       }
       else if(b==3 && c>=20 && c<=21){
         Uurl='https://vedabase.io/en/library/sb/8/3/20-21/';
       }
       else if(b==3 && c>=22 && c<=24){
         Uurl='https://vedabase.io/en/library/sb/8/3/22-24/';
       }
       else if(b==4 && c>=3 && c<=4){
         Uurl='https://vedabase.io/en/library/sb/8/4/3-4/';
       }
       else if(b==4 && c>=11 && c<=12){
         Uurl='https://vedabase.io/en/library/sb/8/4/11-12/';
       }
       else if(b==4 && c>17 && c<=24){
         Uurl='https://vedabase.io/en/library/sb/8/4/17-24/';
       }
       else if(b==5 && c>=11 && c<=12){
         Uurl='https://vedabase.io/en/library/sb/8/5/11-12/';
       }
       else if(b==5 && c>=15 && c<=16){
         Uurl='https://vedabase.io/en/library/sb/8/5/15-16/';
       }
       else if(b==5 && c>=17 && c<=18){
         Uurl='https://vedabase.io/en/library/sb/8/5/17-18/';
       }
       else if(b==5 && c>=19 && c<=20){
         Uurl='https://vedabase.io/en/library/sb/8/5/19-20/';
       }
       else if(b==6 && c>=3 && c<=7){
         Uurl='https://vedabase.io/en/library/sb/8/6/3-7/';
       }
       else if(b==6 && c>=22 && c<=23){
         Uurl='https://vedabase.io/en/library/sb/8/6/22-23/';
       }
       else if(b==8 && c>=39 && c<=40){
         Uurl='https://vedabase.io/en/library/sb/8/8/39-40/';
       }
       else if(b==8 && c>=41 && c<=46){
         Uurl='https://vedabase.io/en/library/sb/8/8/41-46/';
       }
       else if(b==9 && c>=14 && c<=15){
         Uurl='https://vedabase.io/en/library/sb/8/9/14-15/';
       }
       else if(b==9 && c>=16 && c<=17){
         Uurl='https://vedabase.io/en/library/sb/8/9/16-17/';
       }
       else if(b==10 && c>=10 && c<=12){
         Uurl='https://vedabase.io/en/library/sb/8/10/10-12/';
       }
       else if(b==10 && c>=13 && c<=15){
         Uurl='https://vedabase.io/en/library/sb/8/10/13-15/';
       }
       else if(b==10 && c>=16 && c<=18){
         Uurl='https://vedabase.io/en/library/sb/8/10/16-18/';
       }
       else if(b==10 && c>=19 && c<=24){
         Uurl='https://vedabase.io/en/library/sb/8/10/19-24/';
       }
       else if(b==10 && c>=30 && c<=31){
         Uurl='https://vedabase.io/en/library/sb/8/10/30-31/';
       }
       else if(b==10 && c>=32 && c<=34){
         Uurl='https://vedabase.io/en/library/sb/8/10/32-34/';
       }
       else if(b==12 && c>=1 && c<=2){
         Uurl='https://vedabase.io/en/library/sb/8/12/1-2/';
       }
       else if(b==12 && c>=29 && c<=30){
         Uurl='https://vedabase.io/en/library/sb/8/12/29-30/';
       }
       else if(b==13 && c>=2 && c<=3){
         Uurl='https://vedabase.io/en/library/sb/8/13/2-3/';
       }
       else if(b==13 && c>=15 && c<=16){
         Uurl='https://vedabase.io/en/library/sb/8/13/15-16/';
       }
       else if(b==15 && c>=1 && c<=2){
         Uurl='https://vedabase.io/en/library/sb/8/15/1-2/';
       }
       else if(b==15 && c>=8 && c<=9){
         Uurl='https://vedabase.io/en/library/sb/8/15/8-9/';
       }
       else if(b==15 && c>=10 && c<=11){
         Uurl='https://vedabase.io/en/library/sb/8/15/10-11/';
       }
       else if(b==16 && c>=44 && c<=45){
         Uurl='https://vedabase.io/en/library/sb/8/16/44-45/';
       }
       else if(b==16 && c>=51 && c<=52){
         Uurl='https://vedabase.io/en/library/sb/8/16/51-52/';
       }
       else if(b==17 && c>=2 && c<=3){
         Uurl='https://vedabase.io/en/library/sb/8/17/2-3/';
       }
       else if(b==18 && c>=9 && c<=10){
         Uurl='https://vedabase.io/en/library/sb/8/18/9-10/';
       }
       else if(b==18 && c>=24 && c<=25){
         Uurl='https://vedabase.io/en/library/sb/8/18/24-25/';
       }
       else if(b==20 && c>=25 && c<=29){
         Uurl='https://vedabase.io/en/library/sb/8/20/25-29/';
       }
       else if(b==20 && c>=32 && c<=33){
         Uurl='https://vedabase.io/en/library/sb/8/20/32-33/';
       }
       else if(b==21 && c>=2 && c<=3){
         Uurl='https://vedabase.io/en/library/sb/8/21/2-3/';
       }
       else if(b==21 && c>=6 && c<=7){
         Uurl='https://vedabase.io/en/library/sb/8/21/6-7/';
       }
       else if(b==21 && c>=16 && c<=17){
         Uurl='https://vedabase.io/en/library/sb/8/21/16-17/';
       }
       else if(b==22 && c>=6 && c<=7){
         Uurl='https://vedabase.io/en/library/sb/8/22/6-7/';
       }
       else if(b==22 && c>=29 && c<=30){
         Uurl='https://vedabase.io/en/library/sb/8/22/29-30/';
       }
       else if(b==23 && c>=11 && c<=12){
         Uurl='https://vedabase.io/en/library/sb/8/23/11-12/';
       }
       else if(b==23 && c>=20 && c<=21){
         Uurl='https://vedabase.io/en/library/sb/8/23/20-21/';
       }
       else if(b==23 && c>=22 && c<=23){
         Uurl='https://vedabase.io/en/library/sb/8/23/22-23/';
       }
       else if(b==23 && c>=26 && c<=27){
         Uurl='https://vedabase.io/en/library/sb/8/23/26-27/';
       }
       else if(b==24 && c>=2 && c<=3){
         Uurl='https://vedabase.io/en/library/sb/8/24/2-3/';
       }
       else if(b==24 && c>=34 && c<=35){
         Uurl='https://vedabase.io/en/library/sb/8/24/34-35/';
       }
       else {
         Uurl = 'https://vedabase.io/en/library/sb/8/$b/$c/';
       }
     }
     else if(a==9){
       if(b==1 && c>=2 && c<=3){
         Uurl='https://vedabase.io/en/library/sb/9/1/2-3/';
       }
       else if(b==1 && c>=11 && c<=12){
         Uurl='https://vedabase.io/en/library/sb/9/1/11-12/';
       }
       else if(b==1 && c>=23 && c<=24){
         Uurl='https://vedabase.io/en/library/sb/9/1/23-24/';
       }
       else if(b==1 && c>=38 && c<=39){
         Uurl='https://vedabase.io/en/library/sb/9/1/38-39/';
       }
       else if(b==2 && c>=5 && c<=6){
         Uurl='https://vedabase.io/en/library/sb/9/2/5-6/';
       }
       else if(b==2 && c>=11 && c<=13){
         Uurl='https://vedabase.io/en/library/sb/9/2/11-13/';
       }
       else if(b==2 && c>=23 && c<=24){
         Uurl='https://vedabase.io/en/library/sb/9/2/23-24/';
       }
       else if(b==2 && c>=35 && c<=36){
         Uurl='https://vedabase.io/en/library/sb/9/2/35-36/';
       }
       else if(b==4&& c>=4 && c<=5){
         Uurl='https://vedabase.io/en/library/sb/9/4/4-5/';
       }
       else if(b==4&& c>=15 && c<=16){
         Uurl='https://vedabase.io/en/library/sb/9/4/15-16/';
       }
       else if(b==4&& c>=18 && c<=20){
         Uurl='https://vedabase.io/en/library/sb/9/4/18-20/';
       }
       else if(b==4&& c>=31 && c<=32){
         Uurl='https://vedabase.io/en/library/sb/9/4/31-32/';
       }
       else if(b==4&& c>=33 && c<=35){
         Uurl='https://vedabase.io/en/library/sb/9/4/33-35/';
       }
       else if(b==4&& c>=39 && c<=40){
         Uurl='https://vedabase.io/en/library/sb/9/4/39-40/';
       }
       else if(b==6&& c>=41 && c<=42){
         Uurl='https://vedabase.io/en/library/sb/9/4/41-42/';
       }
       else if(b==4&& c>=53 && c<=54){
         Uurl='https://vedabase.io/en/library/sb/9/4/53-54/';
       }
       else if(b==4&& c>=57 && c<=59){
         Uurl='https://vedabase.io/en/library/sb/9/4/57-59/';
       }
       else if(b==6 && c>=15 && c<=16){
         Uurl='https://vedabase.io/en/library/sb/9/6/15-16/';
       }
       else if(b==6 && c>=23 && c<=24){
         Uurl='https://vedabase.io/en/library/sb/9/6/23-24/';
       }
       else if(b==6 && c>=33 && c<=34){
         Uurl='https://vedabase.io/en/library/sb/9/6/33-34/';
       }
       else if(b==6 && c>=35 && c<=36){
         Uurl='https://vedabase.io/en/library/sb/9/6/35-36/';
       }
       else if(b==6 && c>=39 && c<=40){
         Uurl='https://vedabase.io/en/library/sb/9/6/39-40/';
       }
       else if(b==6 && c>=45 && c<=46){
         Uurl='https://vedabase.io/en/library/sb/9/6/45-46/';
       }
       else if(b==7 && c>=5 && c<=6){
         Uurl='https://vedabase.io/en/library/sb/9/7/5-6/';
       }
       else if(b==7 && c>=25 && c<=26){
         Uurl='https://vedabase.io/en/library/sb/9/7/25-26/';
       }
       else if(b==8 && c>=5 && c<=6){
         Uurl='https://vedabase.io/en/library/sb/9/8/5-6/';
       }
       else if(b==8 && c>=9 && c<=10){
         Uurl='https://vedabase.io/en/library/sb/9/8/9-10/';
       }
       else if(b==8 && c>=15 && c<=16){
         Uurl='https://vedabase.io/en/library/sb/9/8/15-16/';
       }
       else if(b==9 && c>=16 && c<=17){
         Uurl='https://vedabase.io/en/library/sb/9/9/16-17/';
       }
       else if(b==9 && c>=20 && c<=21){
         Uurl='https://vedabase.io/en/library/sb/9/9/20-21/';
       }
       else if(b==9 && c>=23 && c<=24){
         Uurl='https://vedabase.io/en/library/sb/9/9/23-24/';
       }
       else if(b==9 && c>=26 && c<=27){
         Uurl='https://vedabase.io/en/library/sb/9/9/20-21/';
       }
       else if(b==10 && c>=6 && c<=7){
         Uurl='https://vedabase.io/en/library/sb/9/10/6-7/';
       }
       else if(b==10 && c>=35 && c<=38){
         Uurl='https://vedabase.io/en/library/sb/9/10/35-38/';
       }
       else if(b==10 && c>=39 && c<=40){
         Uurl='https://vedabase.io/en/library/sb/9/10/39-40/';
       }
       else if(b==10 && c>=42 && c<=43){
         Uurl='https://vedabase.io/en/library/sb/9/10/42-43/';
       }
       else if(b==10 && c>=45 && c<=46){
         Uurl='https://vedabase.io/en/library/sb/9/10/45-56/';
       }
       else if(b==11 && c>=13 && c<=14){
         Uurl='https://vedabase.io/en/library/sb/9/11/13-14/';
       }
       else if(b==11 && c>=31 && c<=34){
         Uurl='https://vedabase.io/en/library/sb/9/11/31-34/';
       }
       else if(b==12 && c>=3 && c<=4){
         Uurl='https://vedabase.io/en/library/sb/9/12/3-4/';
       }
       else if(b==13 && c>=20 && c<=21){
         Uurl='https://vedabase.io/en/library/sb/9/13/20-21/';
       }
       else if(b==14 && c>=15 && c<=16){
         Uurl='https://vedabase.io/en/library/sb/9/14/15-16/';
       }
       else if(b==14 && c>=17 && c<=18){
         Uurl='https://vedabase.io/en/library/sb/9/14/17-18/';
       }
       else if(b==14 && c>=44 && c<=45){
         Uurl='https://vedabase.io/en/library/sb/9/14/44-45/';
       }
       else if(b==15 && c>=2 && c<=3){
         Uurl='https://vedabase.io/en/library/sb/9/15/2-3/';
       }
       else if(b==15 && c>=5 && c<=6){
         Uurl='https://vedabase.io/en/library/sb/9/15/5-6/';
       }
       else if(b==15 && c>=12 && c<=13){
         Uurl='https://vedabase.io/en/library/sb/9/15/12-13/';
       }
       else if(b==15 && c>=17 && c<=19){
         Uurl='https://vedabase.io/en/library/sb/9/15/17-19/';
       }
       else if(b==15 && c>=35 && c<=36){
         Uurl='https://vedabase.io/en/library/sb/9/15/35-36/';
       }
       else if(b==16 && c>=18 && c<=19){
         Uurl='https://vedabase.io/en/library/sb/9/16/18-19/';
       }
       else if(b==16 && c>=21 && c<=22){
         Uurl='https://vedabase.io/en/library/sb/9/16/21-22/';
       }
       else if(b==17 && c>=1 && c<=3){
         Uurl='https://vedabase.io/en/library/sb/9/17/1-3/';
       }
       else if(b==18 && c>=6 && c<=7){
         Uurl='https://vedabase.io/en/library/sb/9/18/6-7/';
       }
       else if(b==18 && c>=12 && c<=14){
         Uurl='https://vedabase.io/en/library/sb/9/18/12-14/';
       }
       else if(b==18 && c>=20 && c<=21){
         Uurl='https://vedabase.io/en/library/sb/9/18/20-21/';
       }
       else if(b==19 && c>=5 && c<=6){
         Uurl='https://vedabase.io/en/library/sb/9/19/5-6/';
       }
       else if(b==19 && c>=27 && c<=28){
         Uurl='https://vedabase.io/en/library/sb/9/19/27-28/';
       }
       else if(b==20 && c>=4 && c<=5){
         Uurl='https://vedabase.io/en/library/sb/9/20/4-5/';
       }
       else if(b==20 && c>=4 && c<=5){
         Uurl='https://vedabase.io/en/library/sb/9/20/4-5/';
       }
       else if(b==20 && c>=8 && c<=9){
         Uurl='https://vedabase.io/en/library/sb/9/20/8-9/';
       }
       else if(b==20 && c>=24 && c<=26){
         Uurl='https://vedabase.io/en/library/sb/9/20/24-26/';
       }
       else if(b==21 && c>=3 && c<=5){
         Uurl='https://vedabase.io/en/library/sb/9/21/3-5/';
       }
       else if(b==21 && c>=19 && c<=20){
         Uurl='https://vedabase.io/en/library/sb/9/21/19-20/';
       }
       else if(b==21 && c>=28 && c<=29){
         Uurl='https://vedabase.io/en/library/sb/9/21/28-29/';
       }
       else if(b==21 && c>=31 && c<=33){
         Uurl='https://vedabase.io/en/library/sb/9/21/31-33/';
       }
       else if(b==22 && c>=4 && c<=5){
         Uurl='https://vedabase.io/en/library/sb/9/22/4-5/';
       }
       else if(b==22 && c>=12 && c<=13){
         Uurl='https://vedabase.io/en/library/sb/9/22/12-13/';
       }
       else if(b==22 && c>=14 && c<=15){
         Uurl='https://vedabase.io/en/library/sb/9/22/14-15/';
       }
       else if(b==22 && c>=16 && c<=17){
         Uurl='https://vedabase.io/en/library/sb/9/22/16-17/';
       }
       else if(b==22 && c>=18 && c<=19){
         Uurl='https://vedabase.io/en/library/sb/9/22/18-19/';
       }
       else if(b==22 && c>=21 && c<=24){
         Uurl='https://vedabase.io/en/library/sb/9/22/21-24';
       }
       else if(b==22 && c>=27  &&c<=28){
         Uurl='https://vedabase.io/en/library/sb/9/22/27-28/';
       }
       else if(b==22 && c>=30  &&c<=31){
         Uurl='https://vedabase.io/en/library/sb/9/22/30-31/';
       }
       else if(b==22 && c>=44  &&c<=45){
         Uurl='https://vedabase.io/en/library/sb/9/22/44-45/';
       }
       else if(b==22 && c>=46  &&c<=48){
         Uurl='https://vedabase.io/en/library/sb/9/22/46-48/';
       }
       else if(b==23 && c>=3  &&c<=4){
         Uurl='https://vedabase.io/en/library/sb/9/23/3-4/';
       }
       else if(b==23 && c>=7  &&c<=10){
         Uurl='https://vedabase.io/en/library/sb/9/23/7-10/';
       }
       else if(b==23 && c>=18  &&c<=19){
         Uurl='https://vedabase.io/en/library/sb/9/23/18-19/';
       }
       else if(b==23 && c>=20  &&c<=21){
         Uurl='https://vedabase.io/en/library/sb/9/23/20-21/';
       }
       else if(b==23 && c>=30  &&c<=31){
         Uurl='https://vedabase.io/en/library/sb/9/23/30-31/';
       }
       else if(b==23 && c>=35  &&c<=36){
         Uurl='https://vedabase.io/en/library/sb/9/23/35-36/';
       }
       else if(b==24 && c>=3  &&c<=4){
         Uurl='https://vedabase.io/en/library/sb/9/24/3-4/';
       }
       else if(b==24 && c>=6  &&c<=8){
         Uurl='https://vedabase.io/en/library/sb/9/24/6-8/';
       }
       else if(b==24 && c>=10  &&c<=11){
         Uurl='https://vedabase.io/en/library/sb/9/24/10-11/';
       }
       else if(b==24 && c>=16  &&c<=18){
         Uurl='https://vedabase.io/en/library/sb/9/24 /16-18/';
       }
       else if(b==24 && c>=21  &&c<=23){
         Uurl='https://vedabase.io/en/library/sb/9/24 /21-23/';
       }
       else if(b==24 && c>=28  &&c<=31){
         Uurl='https://vedabase.io/en/library/sb/9/24 /28-31/';
       }
       else if(b==24 && c>=47  &&c<=48){
         Uurl='https://vedabase.io/en/library/sb/9/24 /47-48/';
       }
       else if(b==24 && c>=53  &&c<=55){
         Uurl='https://vedabase.io/en/library/sb/9/24 /53-55/';
       }
       else if(b==24 && c>=63  &&c<=64){
         Uurl='https://vedabase.io/en/library/sb/9/24 /63-64/';
       }
       else {
         Uurl = 'https://vedabase.io/en/library/sb/9/$b/$c/';
       }
     }
    else if(a==10){
      if(b==1 && c>=5 && c<=7){
        Uurl='https://vedabase.io/en/library/sb/10/1/5-7/';
      }
      else if(b==1 && c>=31 && c<=32){
        Uurl='https://vedabase.io/en/library/sb/10/1/31-32/';
      }
      else if(b==1 && c>=49 && c<=50){
        Uurl='https://vedabase.io/en/library/sb/10/1/49-50/';
      }
      else if(b==1 && c>=62 && c<=63){
        Uurl='https://vedabase.io/en/library/sb/10/1/62-63/';
      }
      else if(b==1 && c>=65 && c<=66){
        Uurl='https://vedabase.io/en/library/sb/10/1/65-66/';
      }
      else if(b==2 && c>=1 && c<=2){
        Uurl='https://vedabase.io/en/library/sb/10/2/1-2/';
      }
      else if(b==2 && c>=4 && c<=5){
        Uurl='https://vedabase.io/en/library/sb/10/2/4-5/';
      }
      else if(b==2 && c>=11 && c<=12){
        Uurl='https://vedabase.io/en/library/sb/10/2/11-12/';
      }
      else if(b==3 && c>=1 && c<=5){
        Uurl='https://vedabase.io/en/library/sb/10/3/1-5/';
      }
      else if(b==3 && c>=7 && c<=8){
        Uurl='https://vedabase.io/en/library/sb/10/3/7-8/';
      }
      else if(b==3 && c>=9 && c<=10){
        Uurl='https://vedabase.io/en/library/sb/10/3/9-10/';
      }
      else if(b==3 && c>=15 && c<=17){
        Uurl='https://vedabase.io/en/library/sb/10/3/15-17/';
      }
      else if(b==3 && c>=34 && c<=35){
        Uurl='https://vedabase.io/en/library/sb/10/3/34-35/';
      }
      else if(b==3 && c>=37 && c<=38){
        Uurl='https://vedabase.io/en/library/sb/10/3/37-38/';
      }
      else if(b==3 && c>=48 && c<=49){
        Uurl='https://vedabase.io/en/library/sb/10/3/48-49/';
      }
      else if(b==4 && c>=10 && c<=11){
        Uurl='https://vedabase.io/en/library/sb/10/4/10-11/';
      }
      else if(b==5 && c>=1 && c<=2){
        Uurl='https://vedabase.io/en/library/sb/10/5/1-2/';
      }
      else if(b==5 && c>=15 && c<=16){
        Uurl='https://vedabase.io/en/library/sb/10/5/15-16/';
      }
      else if(b==6 && c>=5 && c<=6){
        Uurl='https://vedabase.io/en/library/sb/10/6/5-6/';
      }
      else if(b==6 && c>=15 && c<=17){
        Uurl='https://vedabase.io/en/library/sb/10/6/15-17/';
      }
      else if(b==6 && c>=22 && c<=23){
        Uurl='https://vedabase.io/en/library/sb/10/6/22-23/';
      }
      else if(b==6 && c>=25 && c<=26){
        Uurl='https://vedabase.io/en/library/sb/10/6/25-26/';
      }
      else if(b==6 && c>=27 && c<=29){
        Uurl='https://vedabase.io/en/library/sb/10/6/27-29/';
      }
      else if(b==6 && c>=35 && c<=36){
        Uurl='https://vedabase.io/en/library/sb/10/6/35-36/';
      }
      else if(b==6 && c>=37 && c<=38){
        Uurl='https://vedabase.io/en/library/sb/10/6/37-38/';
      }
      else if(b==6 && c>=39 && c<=40){
        Uurl='https://vedabase.io/en/library/sb/10/6/39-40/';
      }
      else if(b==7 && c>=1 && c<=2){
        Uurl='https://vedabase.io/en/library/sb/10/7/1-2/';
      }
      else if(b==7 && c>=13 && c<=15){
        Uurl='https://vedabase.io/en/library/sb/10/7/13-15/';
      }
      else if(b==7 && c>=35 && c<=36){
        Uurl='https://vedabase.io/en/library/sb/10/7/35-36/';
      }
      else if(b==8 && c>=8 && c<=9){
        Uurl='https://vedabase.io/en/library/sb/10/8/8-9/';
      }
      else if(b==8 && c>=37 && c<=39){
        Uurl='https://vedabase.io/en/library/sb/10/8/37-39/';
      }
      else if(b==9 && c>=1 && c<=2){
        Uurl='https://vedabase.io/en/library/sb/10/9/1-2/';
      }
      else if(b==9 && c>=13 && c<=14){
        Uurl='https://vedabase.io/en/library/sb/10/9/13-14/';
      }
      else if(b==10 && c>=2 && c<=3){
        Uurl='https://vedabase.io/en/library/sb/10/10/2-3/';
      }
      else if(b==10 && c>=20 && c<=22){
        Uurl='https://vedabase.io/en/library/sb/10/10/20-22/';
      }
      else if(b==10 && c>=30 && c<=31){
        Uurl='https://vedabase.io/en/library/sb/10/10/30-31/';
      }
      else if(b==10 && c>=34 && c<=35){
        Uurl='https://vedabase.io/en/library/sb/10/10/34-35/';
      }
      else if(b==11 && c>=31 && c<=33){
        Uurl='https://vedabase.io/en/library/sb/10/11/31-33/';
      }
      else if(b==11 && c>=39 && c<=40){
        Uurl='https://vedabase.io/en/library/sb/10/11/39-40/';
      }
      else if(b==12 && c>=7 && c<=11){
        Uurl='https://vedabase.io/en/library/sb/10/12/7-11/';
      }
      else if(b==13 && c>=47 && c<=48){
        Uurl='https://vedabase.io/en/library/sb/10/13/47-48/';
      }
      else if(b==15 && c>=10 && c<=12){
        Uurl='https://vedabase.io/en/library/sb/10/15/10-12/';
      }
      else if(b==15 && c>=49 && c<=50){
        Uurl='https://vedabase.io/en/library/sb/10/15/49-50/';
      }
      else if(b==16 && c>=13 && c<=15){
        Uurl='https://vedabase.io/en/library/sb/10/16/13-15/';
      }
      else if(b==16 && c>=42 && c<=43){
        Uurl='https://vedabase.io/en/library/sb/10/16/42-43/';
      }
      else if(b==16 && c>=65 && c<=67){
        Uurl='https://vedabase.io/en/library/sb/10/16/65-67/';
      }
      else if(b==17 && c>=2 && c<=3){
        Uurl='https://vedabase.io/en/library/sb/10/17/2-3/';
      }
      else if(b==17 && c>=13 && c<=14){
        Uurl='https://vedabase.io/en/library/sb/10/17/13-14/';
      }
      else if(b==20 && c>=30 && c<=31){
        Uurl='https://vedabase.io/en/library/sb/10/20/30-31/';
      }
      else if(b==22 && c>=2 && c<=3){
        Uurl='https://vedabase.io/en/library/sb/10/22/2-3/';
      }
      else if(b==22 && c>=31 && c<=33){
        Uurl='https://vedabase.io/en/library/sb/10/22/31-33/';
      }
      else if(b==23 && c>=10 && c<=11){
        Uurl='https://vedabase.io/en/library/sb/10/23/10-11/';
      }
      else if(b==23 && c>=20 && c<=21){
        Uurl='https://vedabase.io/en/library/sb/10/23/20-21/';
      }
      else if(b==23 && c>=43 && c<=44){
        Uurl='https://vedabase.io/en/library/sb/10/23/43-44/';
      }
      else if(b==23 && c>=48 && c<=49){
        Uurl='https://vedabase.io/en/library/sb/10/23/48-49/';
      }
      else if(b==24 && c>=32 && c<=33){
        Uurl='https://vedabase.io/en/library/sb/10/24/32-33/';
      }
      else if(b==27 && c>=22 && c<=23){
        Uurl='https://vedabase.io/en/library/sb/10/27/22-23/';
      }
      else if(b==29 && c>=6 && c<=7){
        Uurl='https://vedabase.io/en/library/sb/10/29/6-7/';
      }
      else if(b==29 && c>=10 && c<=11){
        Uurl='https://vedabase.io/en/library/sb/10/29/10-11/';
      }
      else if(b==29 && c>=21 && c<=22){
        Uurl='https://vedabase.io/en/library/sb/10/29/21-22/';
      }
      else if(b==29 && c>=45 && c<=46){
        Uurl='https://vedabase.io/en/library/sb/10/29/45-46/';
      }
      else if(b==30 && c>=35 && c<=36){
        Uurl='https://vedabase.io/en/library/sb/10/30/35-36/';
      }
      else if(b==32 && c>=11 && c<=12){
        Uurl='https://vedabase.io/en/library/sb/10/32/11-12/';
      }
      else if(b==33 && c>=26 && c<=27){
        Uurl='https://vedabase.io/en/library/sb/10/33/26-27/';
      }
      else if(b==34 && c>=12 && c<=13){
        Uurl='https://vedabase.io/en/library/sb/10/34/12-13/';
      }
      else if(b==35 && c>=2 && c<=3){
        Uurl='https://vedabase.io/en/library/sb/10/35/2-3/';
      }
      else if(b==35 && c>=4 && c<=5){
        Uurl='https://vedabase.io/en/library/sb/10/35/4-5/';
      }
      else if(b==35 && c>=6 && c<=7){
        Uurl='https://vedabase.io/en/library/sb/10/35/6-7/';
      }
      else if(b==35 && c>=8 && c<=11){
        Uurl='https://vedabase.io/en/library/sb/10/35/8-11/';
      }
      else if(b==35 && c>=12 && c<=13){
        Uurl='https://vedabase.io/en/library/sb/10/35/12-13/';
      }
      else if(b==35 && c>=14 && c<=15){
        Uurl='https://vedabase.io/en/library/sb/10/35/14-15/';
      }
      else if(b==35 && c>=16 && c<=17){
        Uurl='https://vedabase.io/en/library/sb/10/35/16-17/';
      }
      else if(b==35 && c>=18 && c<=19){
        Uurl='https://vedabase.io/en/library/sb/10/35/18-19/';
      }
      else if(b==35 && c>=20 && c<=21){
        Uurl='https://vedabase.io/en/library/sb/10/35/20-21/';
      }
      else if(b==35 && c>=22 && c<=23){
        Uurl='https://vedabase.io/en/library/sb/10/35/22-23/';
      }
      else if(b==35 && c>=24 && c<=25){
        Uurl='https://vedabase.io/en/library/sb/10/35/24-25/';
      }
      else if(b==36 && c>=3 && c<=4){
        Uurl='https://vedabase.io/en/library/sb/10/36/3-4/';
      }
      else if(b==36 && c>=22 && c<=23){
        Uurl='https://vedabase.io/en/library/sb/10/36/22-23/';
      }
      else if(b==37 && c>=1 && c<=2){
        Uurl='https://vedabase.io/en/library/sb/10/37/1-2/';
      }
      else if(b==37 && c>=10 && c<=11){
        Uurl='https://vedabase.io/en/library/sb/10/37/10-11/';
      }
      else if(b==37 && c>=15 && c<=20){
        Uurl='https://vedabase.io/en/library/sb/10/37/15-20/';
      }
      else if(b==38 && c>=28 && c<=33){
        Uurl='https://vedabase.io/en/library/sb/10/38/28-33/';
      }
      else if(b==38 && c>=37 && c<=38){
        Uurl='https://vedabase.io/en/library/sb/10/38/37-38/';
      }
      else if(b==39 && c>=11 && c<=12){
        Uurl='https://vedabase.io/en/library/sb/10/39/11-12/';
      }
      else if(b==39 && c>=17 && c<=18){
        Uurl='https://vedabase.io/en/library/sb/10/39/17-18/';
      }
      else if(b==39 && c>=42 && c<=43){
        Uurl='https://vedabase.io/en/library/sb/10/39/42-43/';
      }
      else if(b==39 && c>=44 && c<=45){
        Uurl='https://vedabase.io/en/library/sb/10/39/44-45/';
      }
      else if(b==39 && c>=46 && c<=48){
        Uurl='https://vedabase.io/en/library/sb/10/39/46-48/';
      }
      else if(b==39 && c>=49 && c<=50){
        Uurl='https://vedabase.io/en/library/sb/10/39/49-50/';
      }
      else if(b==39 && c>=51 && c<=52){
        Uurl='https://vedabase.io/en/library/sb/10/39/51-52/';
      }
      else if(b==39 && c>=53 && c<=55){
        Uurl='https://vedabase.io/en/library/sb/10/39/53-55/';
      }
      else if(b==39 && c>=56 && c<=57){
        Uurl='https://vedabase.io/en/library/sb/10/39/56-57/';
      }
      else if(b==40 && c>=13 && c<=14){
        Uurl='https://vedabase.io/en/library/sb/10/40/13-14/';
      }
      else if(b==40 && c>=17 && c<=18){
        Uurl='https://vedabase.io/en/library/sb/10/40/17-18/';
      }
      else if(b==41 && c>=20 && c<=23){
        Uurl='https://vedabase.io/en/library/sb/10/41/20-23/';
      }
      else if(b==42 && c>=26 && c<=27){
        Uurl='https://vedabase.io/en/library/sb/10/42/26-27/';
      }
      else if(b==42 && c>=28 && c<=31){
        Uurl='https://vedabase.io/en/library/sb/10/42/28-31/';
      }
      else if(b==43 && c>=21 && c<=22){
        Uurl='https://vedabase.io/en/library/sb/10/43/21-22/';
      }
      else if(b==43 && c>=26 && c<=27){
        Uurl='https://vedabase.io/en/library/sb/10/43/26-27/';
      }
      else if(b==44 && c>=22 && c<=23){
        Uurl='https://vedabase.io/en/library/sb/10/44/22-23/';
      }
      else if(b==44 && c>=24 && c<=25){
        Uurl='https://vedabase.io/en/library/sb/10/44/24-25/';
      }
      else if(b==45 && c>=15 && c<=16){
        Uurl='https://vedabase.io/en/library/sb/10/45/15-16/';
      }
      else if(b==45 && c>=17 && c<=18){
        Uurl='https://vedabase.io/en/library/sb/10/45/17-18/';
      }
      else if(b==45 && c>=30 && c<=31){
        Uurl='https://vedabase.io/en/library/sb/10/45/30-31/';
      }
      else if(b==45 && c>=35 && c<=36){
        Uurl='https://vedabase.io/en/library/sb/10/45/35-36/';
      }
      else if(b==45 && c>=42 && c<=44){
        Uurl='https://vedabase.io/en/library/sb/10/45/42-44/';
      }
      else if(b==46 && c>=9 && c<=13){
        Uurl='https://vedabase.io/en/library/sb/10/46/9-13/';
      }
      else if(b==46 && c>=32 && c<=33){
        Uurl='https://vedabase.io/en/library/sb/10/46/32-33/';
      }
      else if(b==47 && c>=1 && c<=2){
        Uurl='https://vedabase.io/en/library/sb/10/47/1-2/';
      }
      else if(b==47 && c>=9 && c<=10){
        Uurl='https://vedabase.io/en/library/sb/10/47/9-10/';
      }
      else if(b==48 && c>=13 && c<=14){
        Uurl='https://vedabase.io/en/library/sb/10/48/13-14/';
      }
      else if(b==48 && c>=15 && c<=16){
        Uurl='https://vedabase.io/en/library/sb/10/48/15-16/';
      }
      else if(b==49 && c>=1 && c<=2){
        Uurl='https://vedabase.io/en/library/sb/10/49/1-2/';
      }
      else if(b==49 && c>=5 && c<=6){
        Uurl='https://vedabase.io/en/library/sb/10/49/5-6/';
      }
      else if(b==50 && c>=5 && c<=6){
        Uurl='https://vedabase.io/en/library/sb/10/50/5-6/';
      }
      else if(b==50 && c>=7 && c<=8){
        Uurl='https://vedabase.io/en/library/sb/10/50/7-8/';
      }
      else if(b==50 && c>=13 && c<=14){
        Uurl='https://vedabase.io/en/library/sb/10/50/13-14/';
      }
      else if(b==50 && c>=25 && c<=28){
        Uurl='https://vedabase.io/en/library/sb/10/50/25-28/';
      }
      else if(b==50 && c>=32 && c<=33){
        Uurl='https://vedabase.io/en/library/sb/10/50/32-33/';
      }
      else if(b==50 && c>=35 && c<=36){
        Uurl='https://vedabase.io/en/library/sb/10/50/35-36/';
      }
      else if(b==50 && c>=37 && c<=38){
        Uurl='https://vedabase.io/en/library/sb/10/50/37-38/';
      }
      else if(b==50 && c>=50 && c<=53){
        Uurl='https://vedabase.io/en/library/sb/10/50/50-53/';
      }
      else if(b==51 && c>=1 && c<=6){
        Uurl='https://vedabase.io/en/library/sb/10/51/1-6/';
      }
      else if(b==51 && c>=23 && c<=26){
        Uurl='https://vedabase.io/en/library/sb/10/51/23-26/';
      }
      else if(b==51 && c>=39 && c<=40){
        Uurl='https://vedabase.io/en/library/sb/10/51/39-40/';
      }
      else if(b==52 && c>=16 && c<=17){
        Uurl='https://vedabase.io/en/library/sb/10/52/16-17/';
      }
      else if(b==53 && c>=8 && c<=9){
        Uurl='https://vedabase.io/en/library/sb/10/53/8-9/';
      }
      else if(b==53 && c>=18 && c<=19){
        Uurl='https://vedabase.io/en/library/sb/10/53/18-19/';
      }
      else if(b==53 && c>=20 && c<=21){
        Uurl='https://vedabase.io/en/library/sb/10/53/20-21/';
      }
      else if(b==53 && c>=40 && c<=41){
        Uurl='https://vedabase.io/en/library/sb/10/53/40-41/';
      }
      else if(b==53 && c>=42 && c<=43){
        Uurl='https://vedabase.io/en/library/sb/10/53/42-43/';
      }
      else if(b==53 && c>=47 && c<=48){
        Uurl='https://vedabase.io/en/library/sb/10/53/47-48/';
      }
      else if(b==53 && c>=51 && c<=55){
        Uurl='https://vedabase.io/en/library/sb/10/53/51-55/';
      }
      else if(b==54 && c>=19 && c<=20){
        Uurl='https://vedabase.io/en/library/sb/10/54/19-20/';
      }
      else if(b==55 && c>=7 && c<=8){
        Uurl='https://vedabase.io/en/library/sb/10/55/7-8/';
      }
      else if(b==55 && c>=27 && c<=28){
        Uurl='https://vedabase.io/en/library/sb/10/55/27-28/';
      }
      else if(b==56 && c>=29 && c<=30){
        Uurl='https://vedabase.io/en/library/sb/10/56/29-30/';
      }
      else if(b==56 && c>=40 && c<=42){
        Uurl='https://vedabase.io/en/library/sb/10/56/40-42/';
      }
      else if(b==57 && c>=12 && c<=13){
        Uurl='https://vedabase.io/en/library/sb/10/57/12-13/';
      }
      else if(b==57 && c>=35 && c<=36){
        Uurl='https://vedabase.io/en/library/sb/10/57/35-36/';
      }
      else if(b==57 && c>=38 && c<=39){
        Uurl='https://vedabase.io/en/library/sb/10/57/38-39/';
      }
      else if(b==58 && c>=13 && c<=14){
        Uurl='https://vedabase.io/en/library/sb/10/58/13-14/';
      }
      else if(b==58 && c>=50 && c<=51){
        Uurl='https://vedabase.io/en/library/sb/10/58/50-51/';
      }
      else if(b==59 && c>=2 && c<=3){
        Uurl='https://vedabase.io/en/library/sb/10/59/2-3/';
      }
      else if(b==59 && c>=17 && c<=19){
        Uurl='https://vedabase.io/en/library/sb/10/59/17-19/';
      }
      else if(b==59 && c>=38 && c<=39){
        Uurl='https://vedabase.io/en/library/sb/10/59/38-39/';
      }
      else if(b==60 && c>=3 && c<=6){
        Uurl='https://vedabase.io/en/library/sb/10/60/3-6/';
      }
      else if(b==60 && c>=27 && c<=28){
        Uurl='https://vedabase.io/en/library/sb/10/60/27-28/';
      }
      else if(b==61 && c>=8 && c<=9){
        Uurl='https://vedabase.io/en/library/sb/10/61/8-9/';
      }
      else if(b==61 && c>=10 && c<=12){
        Uurl='https://vedabase.io/en/library/sb/10/61/10-12/';
      }
      else if(b==61 && c>=27 && c<=28){
        Uurl='https://vedabase.io/en/library/sb/10/61/27-28/';
      }
      else if(b==62 && c>=18 && c<=19){
        Uurl='https://vedabase.io/en/library/sb/10/62/18-19/';
      }
      else if(b==62 && c>=23 && c<=24){
        Uurl='https://vedabase.io/en/library/sb/10/62/23-24/';
      }
      else if(b==62 && c>=25 && c<=26){
        Uurl='https://vedabase.io/en/library/sb/10/62/25-26/';
      }
      else if(b==62 && c>=29 && c<=30){
        Uurl='https://vedabase.io/en/library/sb/10/62/29-30/';
      }
      else if(b==63 && c>=3 && c<=4){
        Uurl='https://vedabase.io/en/library/sb/10/63/3-4/';
      }
      else if(b==63 && c>=10 && c<=11){
        Uurl='https://vedabase.io/en/library/sb/10/63/10-11/';
      }
      else if(b==63 && c>=35 && c<=36){
        Uurl='https://vedabase.io/en/library/sb/10/63/35-36/';
      }
      else if(b==64 && c>=14 && c<=15){
        Uurl='https://vedabase.io/en/library/sb/10/64/14-15/';
      }
      else if(b==64 && c>=19 && c<=20){
        Uurl='https://vedabase.io/en/library/sb/10/64/19-20/';
      }
      else if(b==64 && c>=27 && c<=28){
        Uurl='https://vedabase.io/en/library/sb/10/64/27-28/';
      }
      else if(b==64 && c>=37 && c<=38){
        Uurl='https://vedabase.io/en/library/sb/10/64/37-38/';
      }
      else if(b==65 && c>=4 && c<=6){
        Uurl='https://vedabase.io/en/library/sb/10/65/4-6/';
      }
      else if(b==65 && c>=11 && c<=12){
        Uurl='https://vedabase.io/en/library/sb/10/65/11-12/';
      }
      else if(b==65 && c>=24 && c<=25){
        Uurl='https://vedabase.io/en/library/sb/10/65/24-25/';
      }
      else if(b==66 && c>=12 && c<=14){
        Uurl='https://vedabase.io/en/library/sb/10/66/12-14/';
      }
      else if(b==66 && c>=27 && c<=28){
        Uurl='https://vedabase.io/en/library/sb/10/66/27-28/';
      }
      else if(b==66 && c>=30 && c<=31){
        Uurl='https://vedabase.io/en/library/sb/10/66/30-31/';
      }
      else if(b==66 && c>=32 && c<=33){
        Uurl='https://vedabase.io/en/library/sb/10/66/32-3/';
      }
      else if(b==67 && c>=9 && c<=10){
        Uurl='https://vedabase.io/en/library/sb/10/67/9-10/';
      }
      else if(b==67 && c>=14 && c<=15){
        Uurl='https://vedabase.io/en/library/sb/10/67/14-15/';
      }
      else if(b==67 && c>=19 && c<=21){
        Uurl='https://vedabase.io/en/library/sb/10/67/19-21/';
      }
      else if(b==68 && c>=9 && c<=10){
        Uurl='https://vedabase.io/en/library/sb/10/68/9-10/';
      }
      else if(b==68 && c>=14 && c<=15){
        Uurl='https://vedabase.io/en/library/sb/10/68/14-15/';
      }
      else if(b==68 && c>=32 && c<=33){
        Uurl='https://vedabase.io/en/library/sb/10/68/32-33/';
      }
      else if(b==68 && c>=42 && c<=43){
        Uurl='https://vedabase.io/en/library/sb/10/68/42-43/';
      }
      else if(b==68 && c>=50 && c<=51){
        Uurl='https://vedabase.io/en/library/sb/10/68/50-51/';
      }
      else if(b==69 && c>=1 && c<=6){
        Uurl='https://vedabase.io/en/library/sb/10/69/1-6/';
      }
      else if(b==69 && c>=7 && c<=8){
        Uurl='https://vedabase.io/en/library/sb/10/69/7-8/';
      }
      else if(b==69 && c>=9 && c<=12){
        Uurl='https://vedabase.io/en/library/sb/10/69/9-12/';
      }
      else if(b==69 && c>=20 && c<=22){
        Uurl='https://vedabase.io/en/library/sb/10/69/20-22/';
      }
      else if(b==70 && c>=4 && c<=5){
        Uurl='https://vedabase.io/en/library/sb/10/70/4-5/';
      }
      else if(b==70 && c>=7 && c<=9){
        Uurl='https://vedabase.io/en/library/sb/10/70/7-9/';
      }
      else if(b==71 && c>=31 && c<=32){
        Uurl='https://vedabase.io/en/library/sb/10/71/31-32/';
      }
      else if(b==71 && c>=41 && c<=42){
        Uurl='https://vedabase.io/en/library/sb/10/71/41-42/';
      }
      else if(b==71 && c>=44 && c<=45){
        Uurl='https://vedabase.io/en/library/sb/10/71/44-45/';
      }
      else if(b==72 && c>=1 && c<=2){
        Uurl='https://vedabase.io/en/library/sb/10/72/1-2/';
      }
      else if(b==72 && c>=24 && c<=25){
        Uurl='https://vedabase.io/en/library/sb/10/72/24-25/';
      }
      else if(b==73 && c>=1 && c<=6){
        Uurl='https://vedabase.io/en/library/sb/10/3/1-6/';
      }
      else if(b==73 && c>=12 && c<=13){
        Uurl='https://vedabase.io/en/library/sb/10/73/12-13/';
      }
      else if(b==74 && c>=7 && c<=9){
        Uurl='https://vedabase.io/en/library/sb/10/74/7-9/';
      }
      else if(b==74 && c>=10 && c<=11){
        Uurl='https://vedabase.io/en/library/sb/10/74/10-11/';
      }
      else if(b==74 && c>=13 && c<=15){
        Uurl='https://vedabase.io/en/library/sb/10/74/13-15/';
      }
      else if(b==74 && c>=20 && c<=21){
        Uurl='https://vedabase.io/en/library/sb/10/74/20-21/';
      }
      else if(b==74 && c>=27 && c<=28){
      Uurl='https://vedabase.io/en/library/sb/10/74/27-28/';
      }
      else if(b==74 && c>=33 && c<=34){
      Uurl='https://vedabase.io/en/library/sb/10/74/33-34/';
      }
      else if(b==75 && c>=1 && c<=2){
      Uurl='https://vedabase.io/en/library/sb/10/75/1-2/';
      }
      else if(b==75 && c>=4 && c<=7){
      Uurl='https://vedabase.io/en/library/sb/10/75/4-7/';
      }
      else if(b==75 && c>=25 && c<=26){
      Uurl='https://vedabase.io/en/library/sb/10/75/25-26/';
      }
      else if(b==75 && c>=34 && c<=35){
      Uurl='https://vedabase.io/en/library/sb/10/75/34-35/';
      }
      else if(b==76 && c>=9 && c<=11){
      Uurl='https://vedabase.io/en/library/sb/10/76/9-11/';
      }
      else if(b==76 && c>=14 && c<=15){
      Uurl='https://vedabase.io/en/library/sb/10/76/14-15/';
      }
      else if(b==76 && c>=18 && c<=19){
      Uurl='https://vedabase.io/en/library/sb/10/76/18-19/';
      }
      else if(b==77 && c>=6 && c<=7){
      Uurl='https://vedabase.io/en/library/sb/10/77/6-7/';
      }
      else if(b==77 && c>=17 && c<=18){
      Uurl='https://vedabase.io/en/library/sb/10/77/17-18/';
      }
      else if(b==78 && c>=1 && c<=2){
      Uurl='https://vedabase.io/en/library/sb/10/78/1-2/';
      }
      else if(b==78 && c>=13 && c<=15){
      Uurl='https://vedabase.io/en/library/sb/10/78/13-15/';
      }
      else if(b==78 && c>=19 && c<=20){
      Uurl='https://vedabase.io/en/library/sb/10/78/19-20/';
      }
      else if(b==78 && c>=25 && c<=26){
      Uurl='https://vedabase.io/en/library/sb/10/78/25-26/';
      }
      else if(b==78 && c>=31 && c<=32){
      Uurl='https://vedabase.io/en/library/sb/10/78/31-32/';
      }
      else if(b==79 && c>=3 && c<=4){
      Uurl='https://vedabase.io/en/library/sb/10/79/3-4/';
      }
      else if(b==79 && c>=11 && c<=15){
      Uurl='https://vedabase.io/en/library/sb/10/79/11-15/';
      }
      else if(b==79 && c>=16 && c<=17){
      Uurl='https://vedabase.io/en/library/sb/10/79/16-17/';
      }
      else if(b==79 && c>=19 && c<=21){
      Uurl='https://vedabase.io/en/library/sb/10/79/19-21/';
      }
      else if(b==80 && c>=12 && c<=13){
      Uurl='https://vedabase.io/en/library/sb/10/80/12-13/';
      }
      else if(b==80 && c>=16 && c<=17){
      Uurl='https://vedabase.io/en/library/sb/10/80/16-17/';
      }
      else if(b==80 && c>=20 && c<=22){
      Uurl='https://vedabase.io/en/library/sb/10/80/20-22/';
      }
      else if(b==80 && c>=25 && c<=26){
      Uurl='https://vedabase.io/en/library/sb/10/80/25-26/';
      }
      else if(b==80 && c>=35 && c<=36){
      Uurl='https://vedabase.io/en/library/sb/10/80/35-36/';
      }
      else if(b==81 && c>=1 && c<=2){
      Uurl='https://vedabase.io/en/library/sb/10/81/1-2/';
      }
      else if(b==81 && c>=6 && c<=7){
      Uurl='https://vedabase.io/en/library/sb/10/81/6-7/';
      }
      else if(b==81 && c>=21 && c<=23){
      Uurl='https://vedabase.io/en/library/sb/10/81/21-23/';
      }
      else if(b==81 && c>=29 && c<=32){
      Uurl='https://vedabase.io/en/library/sb/10/81/29-32/';
      }
      else if(b==82 && c>=3 && c<=6){
      Uurl='https://vedabase.io/en/library/sb/10/82/3-6/';
      }
      else if(b==82 && c>=7 && c<=8){
      Uurl='https://vedabase.io/en/library/sb/10/82/7-8/';
      }
      else if(b==82 && c>=12 && c<=13){
      Uurl='https://vedabase.io/en/library/sb/10/82/12-13/';
      }
      else if(b==82 && c>=23 && c<=26){
      Uurl='https://vedabase.io/en/library/sb/10/82/23-26/';
      }
      else if(b==82 && c>=29 && c<=30){
      Uurl='https://vedabase.io/en/library/sb/10/82/29-30/';
      }
      else if(b==83 && c>=6 && c<=7){
      Uurl='https://vedabase.io/en/library/sb/10/83/6-7/';
      }
      else if(b==83 && c>=13 && c<=14){
      Uurl='https://vedabase.io/en/library/sb/10/83/13-14/';
      }
      else if(b==83 && c>=15 && c<=16){
      Uurl='https://vedabase.io/en/library/sb/10/83/15-16/';
      }
      else if(b==83 && c>=25 && c<=26){
      Uurl='https://vedabase.io/en/library/sb/10/83/25-26/';
      }
      else if(b==83 && c>=41 && c<=42){
      Uurl='https://vedabase.io/en/library/sb/10/83/41-42/';
      }
      else if(b==84 && c>=2 && c<=5){
      Uurl='https://vedabase.io/en/library/sb/10/84/2-5/';
      }
      else if(b==84 && c>=24 && c<=25){
      Uurl='https://vedabase.io/en/library/sb/10/84/24-25/';
      }
      else if(b==84 && c>=32 && c<=35){
      Uurl='https://vedabase.io/en/library/sb/10/84/32-35/';
      }
      else if(b==84 && c>=44 && c<=45){
      Uurl='https://vedabase.io/en/library/sb/10/84/44-45/';
      }
      else if(b==84 && c>=55 && c<=56){
      Uurl='https://vedabase.io/en/library/sb/10/84/55-56/';
      }
      else if(b==84 && c>=57 && c<=58){
      Uurl='https://vedabase.io/en/library/sb/10/84/57-58/';
      }
      else if(b==84 && c>=67 && c<=68){
      Uurl='https://vedabase.io/en/library/sb/10/84/67-68/';
      }
      else if(b==85 && c>=27 && c<=28){
      Uurl='https://vedabase.io/en/library/sb/10/85/27-28/';
      }
      else if(b==85 && c>=32 && c<=33){
      Uurl='https://vedabase.io/en/library/sb/10/85/32-33/';
      }
      else if(b==85 && c>=41 && c<=43){
      Uurl='https://vedabase.io/en/library/sb/10/85/41-43/';
      }
      else if(b==85 && c>=48 && c<=49){
      Uurl='https://vedabase.io/en/library/sb/10/85/48-49/';
      }
      else if(b==85 && c>=55 && c<=56){
      Uurl='https://vedabase.io/en/library/sb/10/85/55-56/';
      }
      else if(b==86 && c>=2 && c<=3){
      Uurl='https://vedabase.io/en/library/sb/10/86/2-3/';
      }
      else if(b==86 && c>=27 && c<=29){
      Uurl='https://vedabase.io/en/library/sb/10/86/27-29/';
      }
      else if(b==87 && c>=12 && c<=13){
      Uurl='https://vedabase.io/en/library/sb/10/87/12-13/';
      }
      else if(b==88 && c>=18 && c<=19){
      Uurl='https://vedabase.io/en/library/sb/10/88/18-19/';
      }
      else if(b==88 && c>=25 && c<=26){
      Uurl='https://vedabase.io/en/library/sb/10/88/25-26/';
      }
      else if(b==88 && c>=27 && c<=28){
      Uurl='https://vedabase.io/en/library/sb/10/88/27-28/';
      }
      else if(b==88 && c>=38 && c<=39){
      Uurl='https://vedabase.io/en/library/sb/10/88/38-39/';
      }
      else if(b==89 && c>=6 && c<=7){
      Uurl='https://vedabase.io/en/library/sb/10/89/6-7/';
      }
      else if(b==89 && c>=8 && c<=9){
      Uurl='https://vedabase.io/en/library/sb/10/89/8-9/';
      }
      else if(b==89 && c>=10 && c<=11){
      Uurl='https://vedabase.io/en/library/sb/10/89/10-11/';
      }
      else if(b==89 && c>=14 && c<=17){
      Uurl='https://vedabase.io/en/library/sb/10/89/14-17/';
      }
      else if(b==89 && c>=26 && c<=27){
      Uurl='https://vedabase.io/en/library/sb/10/89/26-27/';
      }
      else if(b==89 && c>=30 && c<=31){
      Uurl='https://vedabase.io/en/library/sb/10/89/30-31/';
      }
      else if(b==89 && c>=43 && c<=44){
      Uurl='https://vedabase.io/en/library/sb/10/89/43-44/';
      }
      else if(b==89 && c>=48 && c<=49){
      Uurl='https://vedabase.io/en/library/sb/10/89/48-49/';
      }
      else if(b==89 && c>=54 && c<=56){
      Uurl='https://vedabase.io/en/library/sb/10/89/54-56/';
      }
      else if(b==89 && c>=60 && c<=61){
      Uurl='https://vedabase.io/en/library/sb/10/89/60-61/';
      }
      else if(b==90 && c>=1 && c<=7){
      Uurl='https://vedabase.io/en/library/sb/10/90/1-7/';
      }
      else if(b==90 && c>=8 && c<=9){
      Uurl='https://vedabase.io/en/library/sb/10/90/8-9/';
      }
      else if(b==90 && c>=33 && c<=34){
      Uurl='https://vedabase.io/en/library/sb/10/90/33-34/';
      }
    else {
    Uurl = 'https://vedabase.io/en/library/sb/10/$b/$c/';
    }
    }
    else if(a==11){
    if(b==1 && c>=6 && c<=7){
    Uurl='https://vedabase.io/en/library/sb/11/1/6-7/';
    }
    else if(b==1 && c>=11 && c<=12){
    Uurl='https://vedabase.io/en/library/sb/11/1/11-12/';
    }
    else if(b==1 && c>=13 && c<=15){
    Uurl='https://vedabase.io/en/library/sb/11/1/13-15/';
    }
    else if(b==2 && c>=20 && c<=21){
    Uurl='https://vedabase.io/en/library/sb/11/2/20-21/';
    }
    else if(b==3 && c>=27 && c<=28){
    Uurl='https://vedabase.io/en/library/sb/11/3/27-28/';
    }
    else if(b==3 && c>=50 && c<=51){
    Uurl='https://vedabase.io/en/library/sb/11/3/50-51/';
    }
    else if(b==3 && c>=52 && c<=53){
    Uurl='https://vedabase.io/en/library/sb/11/3/52-53/';
    }
    else if(b==5 && c>=29 && c<=30){
    Uurl='https://vedabase.io/en/library/sb/11/5/29-30/';
    }
    else if(b==5 && c>=38 && c<=40){
    Uurl='https://vedabase.io/en/library/sb/11/5/38-40/';
    }
    else if(b==6 && c>=2 && c<=4){
    Uurl='https://vedabase.io/en/library/sb/11/6/2-4/';
    }
    else if(b==6 && c>=26 && c<=27){
    Uurl='https://vedabase.io/en/library/sb/11/6/26-27/';
    }
    else if(b==6 && c>=37 && c<=38){
    Uurl='https://vedabase.io/en/library/sb/11/6/37-38/';
    }
    else if(b==6 && c>=40 && c<=41){
    Uurl='https://vedabase.io/en/library/sb/11/6/40-41/';
    }
    else if(b==6 && c>=48 && c<=49){
    Uurl='https://vedabase.io/en/library/sb/11/6/48-49/';
    }
    else if(b==7 && c>=33 && c<=37){
    Uurl='https://vedabase.io/en/library/sb/11/7/33-37/';
    }
    else if(b==8 && c>=25 && c<=26){
    Uurl='https://vedabase.io/en/library/sb/11/8/25-26/';
    }
    else if(b==9 && c>=17 && c<=18){
    Uurl='https://vedabase.io/en/library/sb/11/9/17-18/';
    }
    else if(b==10 && c>=14 && c<=16){
    Uurl='https://vedabase.io/en/library/sb/11/10/14-16/';
    }
    else if(b==10 && c>=27 && c<=29){
    Uurl='https://vedabase.io/en/library/sb/11/10/27-29/';
    }
    else if(b==10 && c>=36 && c<=37){
    Uurl='https://vedabase.io/en/library/sb/11/10/36-37/';
    }
    else if(b==11 && c>=12 && c<=13){
    Uurl='https://vedabase.io/en/library/sb/11/11/12-13/';
    }
    else if(b==11 && c>=23 && c<=24){
    Uurl='https://vedabase.io/en/library/sb/11/11/23-24/';
    }
    else if(b==11 && c>=29 && c<=32){
    Uurl='https://vedabase.io/en/library/sb/11/11/29-32/';
    }
    else if(b==11 && c>=34 && c<=41){
    Uurl='https://vedabase.io/en/library/sb/11/11/34-41/';
    }
    else if(b==11 && c>=43 && c<=45){
    Uurl='https://vedabase.io/en/library/sb/11/11/43-45/';
    }
    else if(b==12 && c>=1 && c<=2){
    Uurl='https://vedabase.io/en/library/sb/11/12/1-2/';
    }
    else if(b==12 && c>=3 && c<=6){
    Uurl='https://vedabase.io/en/library/sb/11/12/3-6/';
    }
    else if(b==12 && c>=14 && c<=15){
    Uurl='https://vedabase.io/en/library/sb/11/12/14-15/';
    }
    else if(b==12 && c>=22 && c<=23){
    Uurl='https://vedabase.io/en/library/sb/11/12/22-23/';
    }
    else if(b==13 && c>=9 && c<=10){
    Uurl='https://vedabase.io/en/library/sb/11/13/9-10/';
    }
    else if(b==14 && c>=5 && c<=7){
    Uurl='https://vedabase.io/en/library/sb/11/14/5-7/';
    }
    else if(b==14 && c>=32 && c<=33){
    Uurl='https://vedabase.io/en/library/sb/11/14/32-33/';
    }
    else if(b==14 && c>=36 && c<=42){
    Uurl='https://vedabase.io/en/library/sb/11/14/36-42/';
    }
    else if(b==15 && c>=4 && c<=5){
    Uurl='https://vedabase.io/en/library/sb/11/15/4-5/';
    }
    else if(b==15 && c>=6 && c<=7){
    Uurl='https://vedabase.io/en/library/sb/11/15/6-7/';
    }
    else if(b==15 && c>=8 && c<=9){
    Uurl='https://vedabase.io/en/library/sb/11/15/8-9/';
    }
    else if(b==17 && c>=1 && c<=2){
    Uurl='https://vedabase.io/en/library/sb/11/17/1-2/';
    }
    else if(b==17 && c>=3 && c<=4){
    Uurl='https://vedabase.io/en/library/sb/11/17/3-4/';
    }
    else if(b==17 && c>=5 && c<=6){
    Uurl='https://vedabase.io/en/library/sb/11/17/5-6/';
    }
    else if(b==17 && c>=34 && c<=35){
    Uurl='https://vedabase.io/en/library/sb/11/17/34-35/';
    }
    else if(b==18 && c>=40 && c<=41){
    Uurl='https://vedabase.io/en/library/sb/11/18/40-41/';
    }
    else if(b==19 && c>=20 && c<=24){
    Uurl='https://vedabase.io/en/library/sb/11/19/20-24/';
    }
    else if(b==19 && c>=28 && c<=32){
    Uurl='https://vedabase.io/en/library/sb/11/19/28-32/';
    }
    else if(b==19 && c>=33 && c<=35){
    Uurl='https://vedabase.io/en/library/sb/11/19/33-35/';
    }
    else if(b==19 && c>=36 && c<=39){
    Uurl='https://vedabase.io/en/library/sb/11/19/36-39/';
    }
    else if(b==19 && c>=40 && c<=45){
    Uurl='https://vedabase.io/en/library/sb/11/19/40-45/';
    }
    else if(b==20 && c>=27 && c<=28){
    Uurl='https://vedabase.io/en/library/sb/11/20/27-28/';
    }
    else if(b==20 && c>=32 && c<=33){
    Uurl='https://vedabase.io/en/library/sb/11/20/32-33/';
    }
    else if(b==21 && c>=29 && c<=30){
    Uurl='https://vedabase.io/en/library/sb/11/21/29-30/';
    }
    else if(b==21 && c>=33 && c<=34){
    Uurl='https://vedabase.io/en/library/sb/11/21/33-34/';
    }
    else if(b==21 && c>=38 && c<=40){
    Uurl='https://vedabase.io/en/library/sb/11/21/38-40/';
    }
    else if(b==22 && c>=1 && c<=3){
    Uurl='https://vedabase.io/en/library/sb/11/22/1-3/';
    }
    else if(b==22 && c>=35 && c<=36){
    Uurl='https://vedabase.io/en/library/sb/11/22/35-36/';
    }
    else if(b==22 && c>=54 && c<=55){
    Uurl='https://vedabase.io/en/library/sb/11/22/54-55/';
    }
    else if(b==22 && c>=58 && c<=59){
    Uurl='https://vedabase.io/en/library/sb/11/22/58-59/';
    }
    else if(b==23 && c>=18 && c<=19){
    Uurl='https://vedabase.io/en/library/sb/11/23/18-19/';
    }
    else if(b==23 && c>=38 && c<=39){
    Uurl='https://vedabase.io/en/library/sb/11/23/38-39/';
    }
    else if(b==24 && c>=22 && c<=27){
    Uurl='https://vedabase.io/en/library/sb/11/24/22-27/';
    }
    else if(b==25 && c>=2 && c<=5){
    Uurl='https://vedabase.io/en/library/sb/11/25/2-5/';
    }
    else if(b==26 && c>=19 && c<=20){
    Uurl='https://vedabase.io/en/library/sb/11/26/19-20/';
    }
    else if(b==27 && c>=3 && c<=4){
    Uurl='https://vedabase.io/en/library/sb/11/27/3-4/';
    }
    else if(b==27 && c>=16 && c<=17){
    Uurl='https://vedabase.io/en/library/sb/11/27/16-17/';
    }
    else if(b==27 && c>=25 && c<=26){
    Uurl='https://vedabase.io/en/library/sb/11/27/25-26/';
    }
    else if(b==27 && c>=30 && c<=31){
    Uurl='https://vedabase.io/en/library/sb/11/27/30-31/';
    }
    else if(b==27 && c>=38 && c<=41){
    Uurl='https://vedabase.io/en/library/sb/11/27/38-41/';
    }
    else if(b==28 && c>=6 && c<=7){
    Uurl='https://vedabase.io/en/library/sb/11/28/6-7/';
    }
    else if(b==29 && c>=13 && c<=14){
    Uurl='https://vedabase.io/en/library/sb/11/29/13-14/';
    }
    else if(b==29 && c>=41 && c<=44){
    Uurl='https://vedabase.io/en/library/sb/11/29/41-44/';
    }
    else if(b==30 && c>=28 && c<=32){
    Uurl='https://vedabase.io/en/library/sb/11/30/28-32/';
    }
    else if(b==31 && c>=2 && c<=3){
    Uurl='https://vedabase.io/en/library/sb/11/31/2-3/';
    }
    else if(b==31 && c>=16 && c<=17){
    Uurl='https://vedabase.io/en/library/sb/11/31/16-17/';
    }
    else {
    Uurl = 'https://vedabase.io/en/library/sb/11/$b/$c/';
    }
    }
    else if(a==12){
    if(b==1 && c>=1 && c<=2){
    Uurl='https://vedabase.io/en/library/sb/12/1/1-2/';
    }
    else if(b==1 && c>=6 && c<=8){
    Uurl='https://vedabase.io/en/library/sb/12/1/6-8/';
    }
    else if(b==1 && c>=15 && c<=17){
    Uurl='https://vedabase.io/en/library/sb/12/1/15-17/';
    }
    else if(b==1 && c>=21 && c<=26){
    Uurl='https://vedabase.io/en/library/sb/12/1/21-26/';
    }
    else if(b==1 && c>=29 && c<=31){
    Uurl='https://vedabase.io/en/library/sb/12/1/29-31/';
    }
    else if(b==1 && c>=32 && c<=33){
    Uurl='https://vedabase.io/en/library/sb/12/1/32-33/';
    }
    else if(b==1 && c>=39 && c<=40){
    Uurl='https://vedabase.io/en/library/sb/12/1/39-40/';
    }
    else if(b==2 && c>=12 && c<=16){
    Uurl='https://vedabase.io/en/library/sb/12/2/12-16/';
    }
    else if(b==2 && c>=19 && c<=20){
    Uurl='https://vedabase.io/en/library/sb/12/2/19-20/';
    }
    else if(b==2 && c>=27 && c<=28){
    Uurl='https://vedabase.io/en/library/sb/12/2/27-28/';
    }
    else if(b==3 && c>=3 && c<=4){
    Uurl='https://vedabase.io/en/library/sb/12/3/3-4/';
    }
    else if(b==3 && c>=9 && c<=13){
    Uurl='https://vedabase.io/en/library/sb/12/3/9-13/';
    }
    else if(b==3 && c>=39 && c<=40){
    Uurl='https://vedabase.io/en/library/sb/12/3/39-40/';
    }
    else if(b==4 && c>=15 && c<=19){
    Uurl='https://vedabase.io/en/library/sb/12/4/15-19/';
    }
    else if(b==4 && c>=20 && c<=21){
    Uurl='https://vedabase.io/en/library/sb/12/4/20-21/';
    }
    else if(b==5 && c>=11 && c<=12){
    Uurl='https://vedabase.io/en/library/sb/12/5/11-12/';
    }
    else if(b==6 && c>=9 && c<=10){
    Uurl='https://vedabase.io/en/library/sb/12/6/9-10/';
    }
    else if(b==6 && c>=30 && c<=31){
    Uurl='https://vedabase.io/en/library/sb/12/6/30-31/';
    }
    else if(b==6 && c>=40 && c<=41){
    Uurl='https://vedabase.io/en/library/sb/12/6/40-41/';
    }
    else if(b==6 && c>=48 && c<=49){
    Uurl='https://vedabase.io/en/library/sb/12/6/48-49/';
    }
    else if(b==6 && c>=52 && c<=53){
    Uurl='https://vedabase.io/en/library/sb/12/6/52-53/';
    }
    else if(b==6 && c>=54 && c<=56){
    Uurl='https://vedabase.io/en/library/sb/12/6/54-56/';
    }
    else if(b==6 && c>=64 && c<=65){
    Uurl='https://vedabase.io/en/library/sb/12/6/64-65/';
    }
    else if(b==6 && c>=76 && c<=77){
    Uurl='https://vedabase.io/en/library/sb/12/6/76-77/';
    }
    else if(b==7 && c>=9 && c<=10){
    Uurl='https://vedabase.io/en/library/sb/12/7/9-10/';
    }
    else if(b==7 && c>=23 && c<=24){
    Uurl='https://vedabase.io/en/library/sb/12/7/23-24/';
    }
    else if(b==8 && c>=2 && c<=5){
    Uurl='https://vedabase.io/en/library/sb/12/8/2-5/';
    }
    else if(b==8 && c>=7 && c<=11){
    Uurl='https://vedabase.io/en/library/sb/12/8/7-11/';
    }
    else if(b==8 && c>=18 && c<=20){
    Uurl='https://vedabase.io/en/library/sb/12/8/18-20/';
    }
    else if(b==8 && c>=26 && c<=27){
    Uurl='https://vedabase.io/en/library/sb/12/8/26-27/';
    }
    else if(b==8 && c>=33 && c<=34){
    Uurl='https://vedabase.io/en/library/sb/12/8/33-34/';
    }
    else if(b==9 && c>=8 && c<=9){
    Uurl='https://vedabase.io/en/library/sb/12/9/8-9/';
    }
    else if(b==9 && c>=17 && c<=18){
    Uurl='https://vedabase.io/en/library/sb/12/9/17-18/';
    }
    else if(b==9 && c>=22 && c<=25){
    Uurl='https://vedabase.io/en/library/sb/12/9/22-25/';
    }
    else if(b==9 && c>=28 && c<=29){
    Uurl='https://vedabase.io/en/library/sb/12/9/28-29/';
    }
    else if(b==9 && c>=31 && c<=32){
    Uurl='https://vedabase.io/en/library/sb/12/9/31-32/';
    }
    else if(b==10 && c>=11 && c<=13){
    Uurl='https://vedabase.io/en/library/sb/12/10/11-13/';
    }
    else if(b==10 && c>=20 && c<=21){
    Uurl='https://vedabase.io/en/library/sb/12/10/20-21/';
    }
    else if(b==10 && c>=31 && c<=32){
    Uurl='https://vedabase.io/en/library/sb/12/10/31-32/';
    }
    else if(b==11 && c>=2 && c<=3){
    Uurl='https://vedabase.io/en/library/sb/12/11/2-3/';
    }
    else if(b==11 && c>=6 && c<=8){
    Uurl='https://vedabase.io/en/library/sb/12/11/6-8/';
    }
    else if(b==11 && c>=11 && c<=12){
    Uurl='https://vedabase.io/en/library/sb/12/11/11-12/';
    }
    else if(b==11 && c>=14 && c<=15){
    Uurl='https://vedabase.io/en/library/sb/12/11/14-15/';
    }
    else if(b==11 && c>=27 && c<=28){
    Uurl='https://vedabase.io/en/library/sb/12/11/27-28/';
    }
    else if(b==11 && c>=47 && c<=48){
    Uurl='https://vedabase.io/en/library/sb/12/11/47-48/';
    }
    else if(b==12 && c>=14 && c<=15){
    Uurl='https://vedabase.io/en/library/sb/12/12/14-15/';
    }
    else if(b==12 && c>=25 && c<=26){
    Uurl='https://vedabase.io/en/library/sb/12/12/25-26/';
    }
    else if(b==12 && c>=28 && c<=29){
    Uurl='https://vedabase.io/en/library/sb/12/12/28-29/';
    }
    else if(b==12 && c>=31 && c<=33){
    Uurl='https://vedabase.io/en/library/sb/12/12/31-33/';
    }
    else if(b==12 && c>=40 && c<=41){
    Uurl='https://vedabase.io/en/library/sb/12/12/40-41/';
    }
    else if(b==12 && c>=42 && c<=43){
    Uurl='https://vedabase.io/en/library/sb/12/12/42-43/';
    }
    else if(b==13 && c>=4 && c<=9){
    Uurl='https://vedabase.io/en/library/sb/12/13/4-9/';
    }
    else if(b==13 && c>=11 && c<=12){
    Uurl='https://vedabase.io/en/library/sb/12/13/11-12/';
    }
    else {
    Uurl = 'https://vedabase.io/en/library/sb/12/$b/$c/';
    }
    }
    return Uurl;
  }
  Future getWebsiteData(int i,int j, int k) async {
    int bgChapterNum = i;
    int bgShlokaNum = j;
    int bgCantoNum=k;
    String? Translation="";
    String? Purport="";
    final url=Uri.parse(getUrlString(i, j, k)!);
    print(url);
    final response= await http.get(url);
    dom.Document html=dom.Document.html(response.body);
    final ttle=html
        .querySelectorAll(' #content > div ')
        .map((e) => e.text)
        .map((e) => e.replaceAll('<br>', '\n'))
        .toString();
    String? title=extractData(ttle, "(", "Devanagari");
    String? Devanagri = extractData(ttle, "Devanagari", " Text");
    String? Text = extractData(ttle, "Text", " Synonyms");
    String? Synonyms = extractData(ttle, "Synonyms", " Translation");
    Purport = extractData(ttle, "Purport", " )");
    if(Purport==null){
      Translation = extractData(ttle, "Translation", " )");
      Purport="No Purport";
    }
    else{
      Translation = extractData(ttle, "Translation", " Purport");
    }
    print(ttle);
    setState(() {
      articles=List.generate(ttle.length,
              (index) => Article(
                titles: title?.replaceAll("  ", "").replaceAll("\n", ""),
                devnagri: Devanagri?.replaceAll("  ", "").replaceAll("\n", "").replaceAll(" ।", "।\n"),
                verse_text: Text?.replaceAll("  ", "").replaceAll("\n", ""),
                translation_title: Synonyms?.replaceAll("  ", "").replaceAll("\n", ""),
                translation: Translation?.replaceAll("  ", "").replaceAll("\n", ""),
                // purput_tile: purpot_title,
                purpot: Purport?.replaceAll("  ", "").replaceAll("\n\n\n", ""),
          ));
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWebsiteData(10,89,7);
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
      body:ListView.builder(itemCount:articles.length>1?1:articles.length,itemBuilder: (context,index){
        final article=articles[index];
        return ListBody(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article.titles!,style: TextStyle(fontSize: 25,fontWeight:FontWeight.w700),textAlign: TextAlign.center,),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Devanagri",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article.devnagri!,style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),textAlign: TextAlign.center,),
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
              child: Text(article.verse_text!,style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500),textAlign: TextAlign.center,),
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
              child: Text(article.translation_title!,style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500),textAlign: TextAlign.justify,),
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
              child: Text(article.translation!,style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500),textAlign: TextAlign.justify,),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Purport",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(article.purpot!,style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500),textAlign: TextAlign.justify,),
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