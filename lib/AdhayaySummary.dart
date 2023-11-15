import 'package:departure_pr4/All_chaptersModal.dart';
import 'package:departure_pr4/Chapter_1Modal.dart';
import 'package:departure_pr4/Chapter_2Modal.dart';
import 'package:departure_pr4/Setting_Screen.dart';
import 'package:departure_pr4/ThemeModal.dart';
import 'package:departure_pr4/VersePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdhayaySummary extends StatefulWidget{
  int selsectedindex;
  AdhayaySummary({required this.selsectedindex});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdhayaySummaryState(selsectedindex);
  }

}


class AdhayaySummaryState extends State<AdhayaySummary>{
  int selsectedindex;
  AdhayaySummaryState(this.selsectedindex);
List<String> images=['assets/arjuna-vishada-yoga.jpg','assets/sankhya-yoga.jpg','assets/karma-yoga.jpg','assets/jnana-karma-sanyasa-yoga.jpg','assets/karma-sanyasa-yoga.jpg','assets/dhyana-yoga.jpg','assets/gyan-vigyana-yoga.jpg','assets/akshara-brahma-yoga.jpg','assets/raja-vidya-yoga.jpg',
                        'assets/vibhooti-yoga.jpg','assets/vishwaroopa-darshana-yoga.jpg','assets/bhakti-yoga.jpg','assets/kshetra-kshetrajna-vibhaga-yoga.jpg','assets/gunatraya-vibhaga-yoga.jpg','assets/purushotamma-yoga.jpg','assets/daivasura-sampad-vibhaga-yoga.jpg','assets/shraddha-traya-vibhaga-yoga.jpg','assets/moksha-sanyasa-yoga.jpg'];
  @override
  void initState() {
    Provider.of<Chap_1provider>(context,listen: false).chap_1fun();
    Provider.of<Chap_2provider>(context,listen: false).chap_2fun();
    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {

    // TODO: implement build
    return Consumer(
      builder:  (context,ThemeModal themechanger,child) {
        return
          Consumer(
            builder: (context,All_chapprovider aprovider, child) {
              return Scaffold(
                backgroundColor: themechanger.isDark?Colors.black:Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.redAccent,
                  automaticallyImplyLeading: true,
                  title: Text(allchaplist[selsectedindex].name,style: TextStyle(color: themechanger.isDark?Colors.black:Colors.white),),
                  actions: [
                    IconButton(onPressed: () {

                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Setting_Screen(),));
                    }, icon: Icon(Icons.settings,color: themechanger.isDark?Colors.black:Colors.white,size: 20,))
                  ],
                ),
                body:
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: SingleChildScrollView(
                    child: Consumer(
                      builder: (context,summarylang sprovider,child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name of Adhayay : ${allchaplist[selsectedindex].name} (${allchaplist[selsectedindex].name_translation})",style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                            SizedBox(height: 10,),
                              Center(child: Image(image: AssetImage(images[selsectedindex]),height: MediaQuery.of(context).size.height/3,width: MediaQuery.of(context).size.width/2,fit: BoxFit.fill,)),
                        SizedBox(height: 10,),
                              Text("Name Meaning : ${allchaplist[selsectedindex].name_meaning} ",style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),

                            SizedBox(height: 30,),
                              Text("Summary :",style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                            SizedBox(height: 10,),
                            Text("Choose your language :",style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                            SizedBox(height: 10,),
                              Row(
                                children: [
                                  TextButton(onPressed: () {
                                    sprovider.summarylanfun1();
                                  }, child: Text("Hindi",style: TextStyle(color:Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                    SizedBox(width: 50,),
                                  TextButton(onPressed: () {
                                          sprovider.summarylanfun();
                                  }, child: Text("English",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text(sprovider.sl?allchaplist[selsectedindex].chapter_summary_hindi:allchaplist[selsectedindex].chapter_summary,
                                style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 16,fontWeight: FontWeight.bold ),),
                            SizedBox(height: 20,),
                                Consumer(
                                  builder: (context,Chap_1provider cp1provider,child) {
                                    return Center(child: ElevatedButton(
                                      style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) {

                                        return themechanger.isDark?Colors.white:Colors.black ;
                                      })),
                                        onPressed:() {


                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => VersePage(selctedindex: selsectedindex),));
                                        }, child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Verse",style: TextStyle(color:Colors.red,fontSize: 16,fontWeight: FontWeight.bold ),),
                                        )));
                                  }
                                ),


                          ],
                        );
                      }
                    ),
                  ),
                ),
              );
            },
          );
      },
    );
  }
}

class summarylang extends ChangeNotifier{
  bool sl=true;
  void summarylanfun()async{
    sl=false;
    notifyListeners();
  }

  void summarylanfun1()async{
    sl=true;
    notifyListeners();
  }

}