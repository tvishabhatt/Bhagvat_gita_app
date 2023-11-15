import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Chapter_3Modal{

  String verse;
  String san;
  String en;
  String guj;
  String hi;



  Chapter_3Modal({required this.verse,required this.san,required this.en,required this.guj,required this.hi});

  factory Chapter_3Modal.fromjson(Map<String,dynamic> data){
    return Chapter_3Modal(verse: data['verse'],
        san: data['san'],
        en: data['en'],
        guj: data['guj'],
        hi: data['hi']);
  }

  String toString(){
    return "verse:$verse,san:$san,en:$en,guj:$guj,hi:$hi";
  }

  static  List<Chapter_3Modal> parselist(List value){
    List<Chapter_3Modal> listData=value.map((e) => Chapter_3Modal.fromjson(e)).toList();
    return listData;
  }



}
List<Chapter_3Modal> chap_3list=[];
class Chap_3provider extends ChangeNotifier{
  void chap_3fun()async{
    String data=await rootBundle.loadString("assets/chapter_3.json");
    List mainlist=jsonDecode(data);
    chap_3list=Chapter_3Modal.parselist(mainlist);
    notifyListeners();

  }
}