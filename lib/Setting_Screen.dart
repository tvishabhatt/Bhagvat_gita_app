import 'package:departure_pr4/ThemeModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Setting_ScreenState();
  }

}
class Setting_ScreenState extends State<Setting_Screen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(
        builder: (context,ThemeModal themechanger,child) {
          return Scaffold(
            backgroundColor: themechanger.isDark?Colors.black:Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.redAccent,
              automaticallyImplyLeading: true,
              centerTitle: true,
              title: Text("Settings",style: TextStyle(color: themechanger.isDark?Colors.black:Colors.white,),),

            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  GestureDetector(
                    onTap: () {
                      themechanger.isDark=true;
                    },
                    child: SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.dark_mode,color:  themechanger.isDark?Colors.white:Colors.black,),
                          SizedBox(width: 60,),
                          Text("Dark Mode",style: TextStyle(color: themechanger.isDark?Colors.white:Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Divider(height: 3,color:  themechanger.isDark?Colors.white:Colors.black,),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      themechanger.isDark=false;
                    },
                    child: SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.light_mode_outlined,color:  themechanger.isDark?Colors.white:Colors.black,),
                          SizedBox(width: 60,),
                          Text("Light Mode",style: TextStyle(color: themechanger.isDark?Colors.white:Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          );
        }
    );
  }

}