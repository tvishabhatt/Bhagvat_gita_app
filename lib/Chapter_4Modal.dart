import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Chapter_4Modal{

  String verse;
  String san;
  String en;
  String guj;
  String hi;



  Chapter_4Modal({required this.verse,required this.san,required this.en,required this.guj,required this.hi});

  factory Chapter_4Modal.fromjson(Map<String,dynamic> data){
    return Chapter_4Modal(verse: data['verse'],
        san: data['san'],
        en: data['en'],
        guj: data['guj'],
        hi: data['hi']);
  }

  String toString(){
    return "verse:$verse,san:$san,en:$en,guj:$guj,hi:$hi";
  }

  static  List<Chapter_4Modal> parselist(List value){
    List<Chapter_4Modal> listData=value.map((e) => Chapter_4Modal.fromjson(e)).toList();
    return listData;
  }



}
List<Chapter_4Modal> chap_4list=[];
class Chap_4provider extends ChangeNotifier{
  void chap_4fun()async{
    String data=await rootBundle.loadString("assets/chapter_4.json");
    List mainlist=jsonDecode(data);
    chap_4list=Chapter_4Modal.parselist(mainlist);
    notifyListeners();

  }
}