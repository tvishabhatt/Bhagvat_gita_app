import 'package:departure_pr4/Bookmarkpref.dart';
import 'package:departure_pr4/Setting_Screen.dart';
import 'package:departure_pr4/ThemeModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BookmarkPageState();
  }

}
class BookmarkPageState extends State<BookmarkPage>{
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<Bookmarkpref>(context,listen: false).loadString();
    super.initState();
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(
      builder: (context,ThemeModal themechanger,child) {
        return Consumer(
          builder: (context,Bookmarkpref bprovider,child) {

            return Scaffold(
                backgroundColor: themechanger.isDark?Colors.black:Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.redAccent,
                  automaticallyImplyLeading: true,
                  title: Text("BookMarks",style: TextStyle(color: themechanger.isDark?Colors.black:Colors.white,),),
                  actions: [
                    IconButton(onPressed: () {

                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Setting_Screen(),));
                    }, icon: Icon(Icons.settings,color: themechanger.isDark?Colors.black:Colors.white,size: 20,)),

                  ],
                ),
              body:bprovider.stringList.isEmpty?
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(child: Text("You dont'have eny Bookmark Yet ..",style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),)),
              ):Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("All BookMark",style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold )),
                    Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: bprovider.stringList.length,
                          itemBuilder: (context, index) {

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(bprovider.stringList[index],style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold )),
                              trailing: IconButton(onPressed: () => bprovider.removeStringList(bprovider.stringList[index]),icon: Icon(Icons.cancel,color: themechanger.isDark?Colors.white:Colors.black,),),
                            ),
                          );
                        },),
                      ),
                    ),
                  ],
                ),
              )
            );
          }
        );
      }
    );
  }

}