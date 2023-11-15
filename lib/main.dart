import 'package:departure_pr4/AdhayaySummary.dart';
import 'package:departure_pr4/All_chaptersModal.dart';
import 'package:departure_pr4/Bookmarkpref.dart';
import 'package:departure_pr4/Chapter_1Modal.dart';
import 'package:departure_pr4/Chapter_2Modal.dart';
import 'package:departure_pr4/Chapter_3Modal.dart';
import 'package:departure_pr4/Chapter_4Modal.dart';
import 'package:departure_pr4/Chapter_5Modal.dart';
import 'package:departure_pr4/Splace_Screen.dart';
import 'package:departure_pr4/ThemeModal.dart';
import 'package:departure_pr4/VersePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeModal(),),
    ChangeNotifierProvider(create: (context) => All_chapprovider(),),
    ChangeNotifierProvider(create: (context) => Chap_1provider(),),
    ChangeNotifierProvider(create: (context) => Chap_2provider(),),
    ChangeNotifierProvider(create: (context) => Chap_3provider(),),
    ChangeNotifierProvider(create: (context) => Chap_4provider(),),
    ChangeNotifierProvider(create: (context) => Chap_5provider(),),
    ChangeNotifierProvider(create: (context) => summarylang(),),
    ChangeNotifierProvider(create: (context) => translation(),),
    ChangeNotifierProvider(create: (context) => Bookmarkpref(),),
    ChangeNotifierProvider(create: (context) => StringListProvider(),),

  ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Splace_Screen(),
    );
  }
}

