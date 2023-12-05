
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
class Splace_ScreenState extends State<Splace_Screen> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _moveUpAnimation;
  late AnimationController _controller;
  late Animation<double> _animation1;

  @override
  void initState() {
    super.initState();

     _controller=AnimationController(vsync: this,duration: Duration(seconds: 3));
     _animation1=CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
     _controller.forward();



    _animationController=AnimationController(vsync: this,duration: Duration(seconds: 3));
    _fadeAnimation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _moveUpAnimation = Tween<double>(begin: 0, end: -50).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();

    Future.delayed(Duration(seconds:5),() =>
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),)),);

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
                  child: ScaleTransition(

                    scale: _animation1,
                    child: SizedBox(height: 200,width: 200,
                      child: ClipRRect
                        (borderRadius: BorderRadius.circular(20),
                          child: Image(image: AssetImage("assets/Bhagvad gita image.jpg"),height: double.infinity,width: double.infinity,fit: BoxFit.cover,)),
                    ),
                  ),
                ),
                SizedBox(height: 70,),
                Center(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Opacity(
                          opacity: _fadeAnimation.value,
                      child: Transform.translate(
                        offset: Offset(0,_moveUpAnimation.value),
                      child:Text("श्रीमद्भगवद्गीता",
                        style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),),);
                    },

                  ))],
            ),
          );
        }
    );
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

}