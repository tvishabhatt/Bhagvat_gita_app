import 'package:departure_pr4/All_chaptersModal.dart';
import 'package:departure_pr4/Bookmarkpref.dart';
import 'package:departure_pr4/Chapter_1Modal.dart';
import 'package:departure_pr4/Chapter_2Modal.dart';
import 'package:departure_pr4/Chapter_3Modal.dart';
import 'package:departure_pr4/Chapter_4Modal.dart';
import 'package:departure_pr4/Chapter_5Modal.dart';
import 'package:departure_pr4/Setting_Screen.dart';
import 'package:departure_pr4/ThemeModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VersePage extends StatefulWidget{
  int selctedindex;
  VersePage({required this.selctedindex});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VersePageState(selctedindex);
  }

}
class VersePageState extends State<VersePage>{
  int selctedindex;
  VersePageState(this.selctedindex);
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Chap_1provider>(context,listen: false).chap_1fun();
    Provider.of<Chap_2provider>(context,listen: false).chap_2fun();
    Provider.of<Chap_3provider>(context,listen: false).chap_3fun();
    Provider.of<Chap_4provider>(context,listen: false).chap_4fun();
    Provider.of<Chap_5provider>(context,listen: false).chap_5fun();
    Provider.of<Bookmarkpref>(context,listen: false).loadString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List chapterlist=[functionforchp1(),functionforchp2(),functionforchp3(),functionforchp4(),functionforchp5(),functionforchp1(),functionforchp2(),functionforchp3(),functionforchp4(),functionforchp5(),functionforchp1(),functionforchp2(),functionforchp3(),functionforchp4(),functionforchp5(),functionforchp1(),functionforchp2(),functionforchp3()];

    // TODO: implement build
    return Consumer(
      builder: (context,ThemeModal themechanger,child)
      {
        return Scaffold(
          backgroundColor: themechanger.isDark?Colors.black:Colors.white,
          body: chapterlist[selctedindex],
        );
      }
    );
  }
  Widget functionforchp1()
  {
    return Consumer(
          builder: (context,Chap_1provider cpp1provider,child) {
            return Consumer(
                builder: (context,ThemeModal themechanger,child) {
                  return Consumer(
                    builder: (context,Bookmarkpref bprovider,child) {
                      return Scaffold(     backgroundColor: themechanger.isDark?Colors.black:Colors.white,
                        appBar: AppBar(
                          backgroundColor: Colors.redAccent,
                          automaticallyImplyLeading: true,
                          title: Text(allchaplist[selctedindex].name,style: TextStyle(color: themechanger.isDark?Colors.black:Colors.white,),),
                          actions: [
                            IconButton(onPressed: () {

                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Setting_Screen(),));
                            }, icon: Icon(Icons.settings,color: themechanger.isDark?Colors.black:Colors.white,size: 20,))
                          ],
                        ),
                        body:     ListView.builder(
                          shrinkWrap: true,
                          itemCount: chap_1list.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(context: context,
                                  backgroundColor: themechanger.isDark?Colors.black:Colors.white,
                                  isScrollControlled: true,
                                  builder:(context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Consumer(
                                        builder: (context,translation tprovider,child) {
                                          return Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              IconButton(onPressed: () {
                                                Navigator.pop(context);
                                              }, icon: Icon(Icons.arrow_back_ios_new,color: themechanger.isDark?Colors.white:Colors.black,)),
                                              SizedBox(height: 30,),

                                              Center(child: Text(chap_1list[index].san,style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),)),
                                              SizedBox(height: 30,),
                                              Text("Choose your language :",style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                              SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  TextButton(onPressed: () {
                                                  tprovider.translationhin();
                                                  }, child: Text("Hindi",style: TextStyle(color:Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                  SizedBox(width: 50,),
                                                  TextButton(onPressed: () {
                                                   tprovider.translationeng();
                                                  }, child: Text("English",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                  SizedBox(width: 50,),
                                                  TextButton(onPressed: () {
                                                    tprovider.translationguj();
                                                  }, child: Text("Gujrati",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                ],
                                              ),
                                              SizedBox(height: 20,),
                                              Text(tprovider.hin?chap_1list[index].hi:tprovider.eng?chap_1list[index].en:chap_1list[index].guj,
                                                style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                              Expanded(child: SizedBox()),
                                              Text("${allchaplist[selctedindex].name}(${chap_1list[index].verse})",style: TextStyle(color: themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.w500)),
                                            ],
                                          );
                                        }
                                      ),
                                    );
                                  },);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                    title: Center(child: Text(chap_1list[index].san,style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),)),
                                    leading:Text(chap_1list[index].verse,style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                  trailing: IconButton(
                                    onPressed: () {
                                      print(chap_1list.length);
                                      String newString="${chap_1list[index].san}\n(${allchaplist[selctedindex].name} - ${allchaplist[selctedindex].verses_count})";
                                      if(newString.isNotEmpty){
                                        Provider.of<Bookmarkpref>(context,listen: false).addString(newString);
                                      }


                                    },
                                    icon: Icon(Icons.star,color: bprovider.color?Colors.grey:Colors.black,),
                                  ),
                                ),
                              ),
                            );

                          },
                        ),
                      );
                    }
                  );

                }
            );
          }
      );

  }


  Widget functionforchp2() {
    return Consumer(
          builder: (context, ThemeModal themechanger, child) {
            return Consumer(
                builder: (context, Chap_2provider cp2provider, child) {
                  return Consumer(
                    builder: (context,Bookmarkpref bprovider,child) {
                      return Scaffold(
                        backgroundColor: themechanger.isDark ? Colors.black : Colors
                            .white,
                        appBar: AppBar(
                          backgroundColor: Colors.redAccent,
                          automaticallyImplyLeading: true,
                          title: Text(allchaplist[selctedindex].name,
                            style: TextStyle(
                              color: themechanger.isDark ? Colors.black : Colors
                                  .white,),),
                          actions: [
                            IconButton(onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) =>
                                      Setting_Screen(),));
                            },
                                icon: Icon(Icons.settings,
                                  color: themechanger.isDark ? Colors.black : Colors
                                      .white, size: 20,))
                          ],
                        ),
                        body: Center(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: chap_2list.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(context: context,
                                    isScrollControlled: true,
                                    backgroundColor: themechanger.isDark ? Colors
                                        .black : Colors.white,
                                    builder: (context) {
                                      return Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Consumer(
                                          builder: (context,translation tprovider,child) {
                                            return Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                IconButton(onPressed: () {
                                                  Navigator.pop(context);
                                                }, icon: Icon(Icons.arrow_back_ios_new,color: themechanger.isDark?Colors.white:Colors.black,)),
                                                SizedBox(height: 30,),
                                                Center(
                                                  child: Text(chap_2list[index].san,
                                                    style: TextStyle(color: themechanger.isDark ? Colors.white : Colors.black,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold),),
                                                ),
                                                SizedBox(height: 30,),
                                                Text("Choose your language :",style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    TextButton(onPressed: () {
                                                      tprovider.translationhin();
                                                    }, child: Text("Hindi",style: TextStyle(color:Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                    SizedBox(width: 50,),
                                                    TextButton(onPressed: () {
                                                      tprovider.translationeng();
                                                    }, child: Text("English",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                    SizedBox(width: 50,),
                                                    TextButton(onPressed: () {
                                                      tprovider.translationguj();
                                                    }, child: Text("Gujrati",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                  ],
                                                ),
                                                SizedBox(height: 20,),
                                                Text(tprovider.hin?chap_2list[index].hi:tprovider.eng?chap_2list[index].en:chap_2list[index].guj,
                                                  style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                                Expanded(child: SizedBox()),
                                                Text("${allchaplist[selctedindex].name}(${chap_2list[index].verse})",style: TextStyle(color: themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.w500)),

                                              ],
                                            );
                                          }
                                        ),
                                      );
                                    },);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                      title: Center(
                                        child: Text(chap_2list[index].san,
                                          style: TextStyle(color: themechanger.isDark
                                              ? Colors.white
                                              : Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),),
                                      ),
                                      leading: Text(chap_2list[index].verse,
                                        style: TextStyle(color: themechanger.isDark
                                            ? Colors.white
                                            : Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),),
                                    trailing: IconButton(
                                    onPressed: () {
                                      print(chap_2list.length);
                                      String newString="${chap_2list[index].san}\n(${allchaplist[selctedindex].name} - ${allchaplist[selctedindex].verses_count})";
                                      if(newString.isNotEmpty){
                                        Provider.of<Bookmarkpref>(context,listen: false).addString(newString);
                                      }


                                    },
                                    icon: Icon(Icons.star,color: bprovider.color?Colors.grey:Colors.black,),
                                  ),

                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  );
                }
            );
          }
      );
  }


 Widget functionforchp3()
  {
    return  Consumer(
        builder: (context,ThemeModal themechanger,child) {
          return Consumer(
              builder: (context,Chap_3provider cp3provider,child) {
                return Consumer(
                  builder: (context,Bookmarkpref bprovider,child) {
                    return Scaffold(
                      backgroundColor: themechanger.isDark?Colors.black:Colors.white,
                      appBar: AppBar(
                        backgroundColor: Colors.redAccent,
                        automaticallyImplyLeading: true,
                        title: Text(allchaplist[selctedindex].name,style: TextStyle(color: themechanger.isDark?Colors.black:Colors.white,),),
                        actions: [
                          IconButton(onPressed: () {

                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Setting_Screen(),));
                          }, icon: Icon(Icons.settings,color: themechanger.isDark?Colors.black:Colors.white,size: 20,))
                        ],
                      ),
                      body:  Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: chap_3list.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(context: context,
                                  isScrollControlled: true,
                                  backgroundColor: themechanger.isDark?Colors.black:Colors.white,
                                  builder:(context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Consumer(
                                        builder: (context,translation tprovider,child) {
                                          return Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              IconButton(onPressed: () {
                                                Navigator.pop(context);
                                              }, icon: Icon(Icons.arrow_back_ios_new,color: themechanger.isDark?Colors.white:Colors.black,)),
                                              SizedBox(height: 30,),
                                              Center(child: Text(chap_3list[index].san,style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),)),
                                              SizedBox(height: 30,),
                                              Text("Choose your language :",style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                              SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  TextButton(onPressed: () {
                                                    tprovider.translationhin();
                                                  }, child: Text("Hindi",style: TextStyle(color:Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                  SizedBox(width: 50,),
                                                  TextButton(onPressed: () {
                                                    tprovider.translationeng();
                                                  }, child: Text("English",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                  SizedBox(width: 50,),
                                                  TextButton(onPressed: () {
                                                    tprovider.translationguj();
                                                  }, child: Text("Gujrati",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                ],
                                              ),
                                              SizedBox(height: 20,),
                                              Text(tprovider.hin?chap_3list[index].hi:tprovider.eng?chap_3list[index].en:chap_3list[index].guj,
                                                style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                              Expanded(child: SizedBox()),
                                              Text("${allchaplist[selctedindex].name}(${chap_3list[index].verse})",style: TextStyle(color: themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.w500)),
                                            ],
                                          );
                                        }
                                      ),
                                    );
                                  },);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                    title: Center(child: Text(chap_3list[index].san,style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),)),
                                    leading:Text(chap_3list[index].verse,style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                  trailing: IconButton(
                                    onPressed: () {
                                      print(chap_3list.length);
                                      String newString="${chap_3list[index].san}\n(${allchaplist[selctedindex].name} - ${allchaplist[selctedindex].verses_count})";
                                      if(newString.isNotEmpty){
                                        Provider.of<Bookmarkpref>(context,listen: false).addString(newString);
                                      }


                                    },
                                    icon: Icon(Icons.star,color: bprovider.color?Colors.grey:Colors.black,),
                                  ),
                                ),
                              ),
                            );

                          },
                        ),
                      ),
                    );
                  }
                );
              }
          );
        }
    );
  }

  Widget functionforchp4()
  {
    return   Consumer(
        builder: (context,ThemeModal themechanger,child) {
          return Consumer(
              builder: (context,Chap_4provider cp4provider,child) {
                return Consumer(
                  builder: (context,Bookmarkpref bprovider,child) {
                    return Scaffold(
                      backgroundColor: themechanger.isDark?Colors.black:Colors.white,
                      appBar: AppBar(
                        backgroundColor: Colors.redAccent,
                        automaticallyImplyLeading: true,
                        title: Text(allchaplist[selctedindex].name,style: TextStyle(color: themechanger.isDark?Colors.black:Colors.white),),
                        actions: [
                          IconButton(onPressed: () {

                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Setting_Screen(),));
                          }, icon: Icon(Icons.settings,color: themechanger.isDark?Colors.black:Colors.white,size: 20,))
                        ],
                      ),
                      body:    Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: chap_4list.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(context: context,
                                  backgroundColor: themechanger.isDark?Colors.black:Colors.white,
                                  isScrollControlled: true,
                                  builder:(context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Consumer(
                                        builder: (context,translation tprovider,child) {
                                          return Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              IconButton(onPressed: () {
                                                Navigator.pop(context);
                                              }, icon: Icon(Icons.arrow_back_ios_new,color: themechanger.isDark?Colors.white:Colors.black,)),
                                              SizedBox(height: 30,),
                                              Center(child: Text(chap_4list[index].san,style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),)),

                                              SizedBox(height: 30,),
                                              Text("Choose your language :",style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                              SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  TextButton(onPressed: () {
                                                    tprovider.translationhin();
                                                  }, child: Text("Hindi",style: TextStyle(color:Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                  SizedBox(width: 50,),
                                                  TextButton(onPressed: () {
                                                    tprovider.translationeng();
                                                  }, child: Text("English",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                  SizedBox(width: 50,),
                                                  TextButton(onPressed: () {
                                                    tprovider.translationguj();
                                                  }, child: Text("Gujrati",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                ],
                                              ),
                                              SizedBox(height: 20,),
                                              Text(tprovider.hin?chap_4list[index].hi:tprovider.eng?chap_4list[index].en:chap_4list[index].guj,
                                                style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                              Expanded(child: SizedBox()),
                                              Text("${allchaplist[selctedindex].name}(${chap_4list[index].verse})",style: TextStyle(color: themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.w500)),
                                            ],
                                          );
                                        }
                                      ),
                                    );
                                  },);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                    title: Center(child: Text(chap_4list[index].san,style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),)),
                                    leading:Text(chap_4list[index].verse,style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                  trailing: IconButton(
                                    onPressed: () {
                                      print(chap_4list.length);
                                      String newString="${chap_4list[index].san}\n(${allchaplist[selctedindex].name} - ${allchaplist[selctedindex].verses_count})";
                                      if(newString.isNotEmpty){
                                        Provider.of<Bookmarkpref>(context,listen: false).addString(newString);
                                      }


                                    },
                                    icon: Icon(Icons.star,color: bprovider.color?Colors.grey:Colors.black,),
                                  ),
                                ),
                              ),
                            );

                          },
                        ),
                      ),
                    );
                  }
                );
              }
          );
        }
    );
  }


  Widget functionforchp5()
  {
    return      Consumer(
        builder: (context,ThemeModal themechanger,child) {
          return Consumer(
              builder: (context,Chap_5provider cp5provider,child) {
                return Consumer(
                  builder: (context,Bookmarkpref bprovider,child) {
                    return Scaffold(
                      backgroundColor: themechanger.isDark?Colors.black:Colors.white,
                      appBar: AppBar(
                        backgroundColor: Colors.redAccent,
                        automaticallyImplyLeading: true,
                        title: Text(allchaplist[selctedindex].name,style: TextStyle(color: themechanger.isDark?Colors.black:Colors.white),),
                        actions: [
                          IconButton(onPressed: () {

                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Setting_Screen(),));
                          }, icon: Icon(Icons.settings,color: themechanger.isDark?Colors.black:Colors.white,size: 20,))
                        ],
                      ),
                      body:  Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: chap_5list.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(context: context,
                                  backgroundColor: themechanger.isDark?Colors.black:Colors.white,
                                  isScrollControlled: true,
                                  builder:(context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Consumer(
                                        builder: (context,translation tprovider,child) {
                                          return Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              IconButton(onPressed: () {
                                                Navigator.pop(context);
                                              }, icon: Icon(Icons.arrow_back_ios_new,color: themechanger.isDark?Colors.white:Colors.black,)),
                                              SizedBox(height: 30,),
                                              Center(child: Text(chap_5list[index].san,style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),)),
                                              SizedBox(height: 30,),
                                              Text("Choose your language :",style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                              SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  TextButton(onPressed: () {
                                                    tprovider.translationhin();
                                                  }, child: Text("Hindi",style: TextStyle(color:Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                  SizedBox(width: 50,),
                                                  TextButton(onPressed: () {
                                                    tprovider.translationeng();
                                                  }, child: Text("English",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                  SizedBox(width: 50,),
                                                  TextButton(onPressed: () {
                                                    tprovider.translationguj();
                                                  }, child: Text("Gujrati",style: TextStyle(color: Colors.redAccent,fontSize: 16,fontWeight: FontWeight.bold ))),
                                                ],
                                              ),
                                              SizedBox(height: 20,),
                                              Text(tprovider.hin?chap_5list[index].hi:tprovider.eng?chap_5list[index].en:chap_5list[index].guj,
                                                style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                              Expanded(child: SizedBox()),
                                              Text("${allchaplist[selctedindex].name}(${chap_5list[index].verse})",style: TextStyle(color: themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.w500)),
                                            ],
                                          );
                                        }
                                      ),
                                    );
                                  },);
                              },
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    onTap: () {
                                      bprovider.changecolor();
                                    },
                                      title: Center(child: Text(chap_5list[index].san,style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),)),
                                      leading:Text(chap_5list[index].verse,style: TextStyle(color:themechanger.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),),
                                      trailing: IconButton(
                                      onPressed: () {
                                        print(chap_5list.length);
                                        String newString="${chap_1list[index].san}\n${allchaplist[selctedindex].name} - ${allchaplist[selctedindex].verses_count})";
                                        if(newString.isNotEmpty){
                                          Provider.of<Bookmarkpref>(context,listen: false).addString(newString);
                                        }


                                      },
                                        icon: Icon(Icons.star,color: bprovider.color?Colors.grey:Colors.black,),
                                  ),
                                  ),
                                ),
                              ),
                            );

                          },
                        ),
                      ),
                    );
                  }
                );
              }
          );
        }
    );
  }

}

class translation extends ChangeNotifier{

  bool hin=true;
  bool eng=false;
  bool guj=false;
  void translationhin()
  {
    hin=true;
    eng=false;
    guj=false;

    notifyListeners();
  }
  void translationeng()
  {
    hin=false;
    eng=true;
    guj=false;

    notifyListeners();
  }
  void translationguj()
  {
    hin=false;
    eng=false;
    guj=true;

    notifyListeners();
  }
}