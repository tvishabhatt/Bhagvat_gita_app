import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Chapter_2Modal{

  String verse;
  String san;
  String en;
  String guj;
  String hi;



  Chapter_2Modal({required this.verse,required this.san,required this.en,required this.guj,required this.hi});

  factory Chapter_2Modal.fromjson(Map<String,dynamic> data){
    return Chapter_2Modal(verse: data['verse'],
        san: data['san'],
        en: data['en'],
        guj: data['guj'],
        hi: data['hi']);
  }

  String toString(){
    return "verse:$verse,san:$san,en:$en,guj:$guj,hi:$hi";
  }

  static  List<Chapter_2Modal> parselist(List value){
    List<Chapter_2Modal> listData=value.map((e) => Chapter_2Modal.fromjson(e)).toList();
    return listData;
  }



}
List<Chapter_2Modal> chap_2list=[];
class Chap_2provider extends ChangeNotifier{
  void chap_2fun()async{
    String data=await rootBundle.loadString("assets/chapter_ 2.json");
    List mainlist=jsonDecode(data);
    chap_2list=Chapter_2Modal.parselist(mainlist);
    notifyListeners();

  }
}