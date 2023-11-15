
import 'package:departure_pr4/HomePage.dart';
import 'package:departure_pr4/ThemeModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splace_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Splace_ScreenState();
  }

}
class Splace_ScreenState extends State<Splace_Screen>{
  @override
  void initState() {

    // TODO: implement initState
    Future.delayed(Duration(seconds:5),() =>
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),)),);
    super.initState();
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(
        builder: (context,ThemeModal themechanger,child) {
          return Scaffold(
            backgroundColor: themechanger.isDark?Colors.black:Colors.white,
            body: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(height: 200,width: 200,
                    child: ClipRRect
                      (borderRadius: BorderRadius.circular(20),
                        child: Image(image: AssetImage("assets/Bhagvad gita image.jpg"),height: double.infinity,width: double.infinity,fit: BoxFit.cover,)),
                  ),
                ),
                SizedBox(height: 30,),
                Center(child: Text("श्रीमद्भगवद्गीता",style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),))

              ],
            ),
          );
        }
    );
  }

}