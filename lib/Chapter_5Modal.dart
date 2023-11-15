import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Chapter_5Modal{

  String verse;
  String san;
  String en;
  String guj;
  String hi;



  Chapter_5Modal({required this.verse,required this.san,required this.en,required this.guj,required this.hi});

  factory Chapter_5Modal.fromjson(Map<String,dynamic> data){
    return Chapter_5Modal(verse: data['verse'],
        san: data['san'],
        en: data['en'],
        guj: data['guj'],
        hi: data['hi']);
  }

  String toString(){
    return "verse:$verse,san:$san,en:$en,guj:$guj,hin:$hi";
  }

  static  List<Chapter_5Modal> parselist(List value){
    List<Chapter_5Modal> listData=value.map((e) => Chapter_5Modal.fromjson(e)).toList();
    return listData;
  }



}
List<Chapter_5Modal> chap_5list=[];
class Chap_5provider extends ChangeNotifier{
  void chap_5fun()async{
    String data=await rootBundle.loadString("assets/chapter_5.json");
    List mainlist=jsonDecode(data);
    chap_5list=Chapter_5Modal.parselist(mainlist);
    notifyListeners();

  }
}