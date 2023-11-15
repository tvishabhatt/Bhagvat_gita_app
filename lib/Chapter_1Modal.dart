import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Chapter_1Modal{

  String verse;
  String san;
  String en;
  String guj;
  String hi;



  Chapter_1Modal({required this.verse,required this.san,required this.en,required this.guj,required this.hi});

  factory Chapter_1Modal.fromjson(Map<String,dynamic> data){
    return Chapter_1Modal(verse: data['verse'],
        san: data['san'],
        en: data['en'],
        guj: data['guj'],
        hi: data['hi']);
  }

  String toString(){
    return "verse:$verse,san:$san,en:$en,guj:$guj,hi:$hi";
  }

  static  List<Chapter_1Modal> parselist(List value){
    List<Chapter_1Modal> listData=value.map((e) => Chapter_1Modal.fromjson(e)).toList();
    return listData;
  }



}
List<Chapter_1Modal> chap_1list=[];
class Chap_1provider extends ChangeNotifier{
   void chap_1fun()async{
     String data=await rootBundle.loadString("assets/chapter_1.json");
     List mainlist=jsonDecode(data);
     chap_1list=Chapter_1Modal.parselist(mainlist);
     notifyListeners();

   }
}