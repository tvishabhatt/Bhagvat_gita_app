import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class All_chaptersModal{


  int chapter_number;
  String chapter_summary;
  String chapter_summary_hindi;
  int id;
  String image_name;
  String name;
  String name_meaning;
  String name_translation;
  int verses_count;
  String json_path;


  All_chaptersModal({required this.chapter_number,required this.chapter_summary,required this.chapter_summary_hindi,required this.id,required this.image_name,required this.name,required this.name_meaning,required this.name_translation,required this.verses_count,required this.json_path});


  factory All_chaptersModal.fromjson(Map<String,dynamic> data){
    return All_chaptersModal(chapter_number: data['chapter_number'],
        chapter_summary: data['chapter_summary'],
        chapter_summary_hindi: data['chapter_summary_hindi'],
        id: data['id'],
        image_name: data['image_name'],
        name: data['name'],
        name_meaning: data['name_meaning'],
        name_translation: data['name_translation'],
        verses_count: data['verses_count'],
        json_path: data['json_path']);


  }

  String toString(){
  return "chapter_number:$chapter_number,chapter_summary:$chapter_summary,chapter_summary_hindi:$chapter_summary_hindi,id:$id,image_name:$image_name,name:$name,name_meaning:$name_meaning,name_translation:$name_translation,verse_count:$verses_count,json_path:$json_path";
  }

  static  List<All_chaptersModal> parselist(List value){
    List<All_chaptersModal> listData=value.map((e) => All_chaptersModal.fromjson(e)).toList();
    return listData;
  }



}

List<All_chaptersModal> allchaplist=[];

class All_chapprovider extends ChangeNotifier{


   void allfun()async{
     String data=await rootBundle.loadString("assets/all_chapters.json");
     List Listdata=jsonDecode(data);
     allchaplist=All_chaptersModal.parselist(Listdata);
     notifyListeners();
   }

}