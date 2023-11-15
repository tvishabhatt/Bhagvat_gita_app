import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bookmarkpref extends ChangeNotifier{
  List<String> _stringList=[];
  bool color=true;
  List<String> get stringList => _stringList;

  Future<void>loadString()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    _stringList=preferences.getStringList('stringList')??[];
    notifyListeners();
  }

  Future<void> addString(String newString)async{
    _stringList.add(newString);
    await _saveString();

  }
  Future<void> _saveString()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setStringList('stringList', _stringList);
    notifyListeners();
  }


  void removeStringList(String value)async{
    _stringList.remove(value);
await _saveString();
    notifyListeners();
  }


  void changecolor()
  {
    color=false;
    notifyListeners();
  }


}
class Stringitem{
  String text;
  bool isBookmarked;
  Stringitem({required this.text,required this.isBookmarked});
  
  factory Stringitem.fromJson(Map<String,dynamic> data){
    return Stringitem(text: data['text'],
        isBookmarked: data['isBookmarked']);
  }

  Map<String,dynamic> toJson(){
    return {
    'text':text,
    'isBookmarked':isBookmarked
    };
  }
  
}
class StringListModal{
  List<Stringitem> items;
  StringListModal({required this.items});
}

class StringListProvider extends ChangeNotifier{
  List<Stringitem> _items=[];
  List<Stringitem> get items =>_items;

  Future<void> loadItems()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String itemjson=preferences.getString('items')??'[]';
    List<dynamic>itemlist=jsonDecode(itemjson);
    _items=itemlist.map((e) => Stringitem.fromJson(e)).toList();
    notifyListeners();
  }
  
  Future<void> toggleBookmark(Stringitem item)async{
    item.isBookmarked=!item.isBookmarked;
    await _saveItems();
  }
  
  Future<void> _saveItems()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String itemjson=json.encode(_items.map((e) => e.toJson()).toList());
    preferences.setString('items', itemjson);
    notifyListeners();
  }
}