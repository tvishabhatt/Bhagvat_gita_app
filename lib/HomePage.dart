import 'package:departure_pr4/AdhayaySummary.dart';
import 'package:departure_pr4/All_chaptersModal.dart';
import 'package:departure_pr4/BookmarkPage.dart';
import 'package:departure_pr4/Setting_Screen.dart';
import 'package:departure_pr4/ThemeModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }

}
class HomePageState extends State<HomePage>
{
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<All_chapprovider>(context,listen: false).allfun();

    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(
        builder: (context,ThemeModal themechanger,child) {
          return Scaffold(

              backgroundColor: themechanger.isDark?Colors.black:Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.redAccent,
                automaticallyImplyLeading: false,
                title: Text("Adhayay",style: TextStyle(color: themechanger.isDark?Colors.black:Colors.white,),),
                actions: [
                  IconButton(onPressed: () {

                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Setting_Screen(),));
                  }, icon: Icon(Icons.settings,color: themechanger.isDark?Colors.black:Colors.white,size: 20,)),
                  IconButton(onPressed: () {

Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookmarkPage(),));
                  }, icon: Icon(Icons.bookmark_added,color: themechanger.isDark?Colors.black:Colors.white,size: 20,)),
                ],
              ),
              body:  Consumer(
                  builder: (context,All_chapprovider allprovider,child) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Choose Your Adhayay ..",style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                          Expanded(
                            child: SizedBox(
                              child: ListView.builder(
                                itemCount: allchaplist.length,
                                shrinkWrap: true,
                                itemBuilder:(context, index) {
                                  return InkWell(
                                    onTap: () {

                                      print("Click  $index");
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdhayaySummary(selsectedindex: index)));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8,top: 8),
                                      child: Card(
                                        color: themechanger.isDark?Colors.white30:Colors.white,
                                        child: ListTile(
                                          title: Text(allchaplist[index].name,style: TextStyle(color: themechanger.isDark?Colors.white:Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                                          subtitle: Text(allchaplist[index].name_translation,style: TextStyle(color: themechanger.isDark?Colors.white:Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
                                          leading: Text("${allchaplist[index].chapter_number} .",style: TextStyle(color: themechanger.isDark?Colors.white:Colors.black,fontSize: 16),),
                                        ),
                                      ),
                                    ),
                                  );
                                }, ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),

          );
        }
    );
  }

}