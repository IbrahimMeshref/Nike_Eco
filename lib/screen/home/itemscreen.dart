import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../cart/mycart.dart';
import 'LocalDB.dart';
import 'homescreen.dart';
class itemScreen extends StatefulWidget {
  const itemScreen({Key? key}) : super(key: key);

  @override
  State<itemScreen> createState() => _itemScreenState();
}
class _itemScreenState extends State<itemScreen> {
  int currentIndex=0;
  Color heartColor= Colors.grey;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Sneaker Shop",style:TextStyle(fontSize: 15,color: Color.fromRGBO(43, 43, 43, 1)),),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: CircleAvatar(child: Image.asset('assets/images/bag-2.png',width: 44,height: 44,),backgroundColor: Color.fromRGBO(255, 255, 255, 1),),
          ),
        ],
        leading: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child:InkWell(child: CircleAvatar(child: Icon(CupertinoIcons.arrow_left,color: Colors.grey,),backgroundColor: Color.fromRGBO(255, 255, 255, 1),),
              onTap: ()
              {
                Get.to(HomeScreen());
              },
            )
        ),
      ),
      body: Column(
        children: [
          Expanded(child: PageView.builder(
              itemCount: json.length,
              onPageChanged: (int index)
              {
                setState(() {
                  currentIndex =index;
                });
              },
              itemBuilder: (_,i)
              {
                return
                    Container(
                      width: width,
                      height: height,
                      color: Colors.white,
                      child:Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(json[i]["name"],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Color.fromRGBO(43, 43, 43, 1)),),
                            SizedBox(height: height*0.009,),
                            Text(json[i]["gender"],style:TextStyle(fontSize: 15,color: Colors.grey)),
                            SizedBox(height: height*0.009,),
                            Text(json[i]["price"],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Color.fromRGBO(43, 43, 43, 1)),),
                            SizedBox(height: height*0.009,),
                            Image.asset(json[i]["image"],width: 300,height: 250,),
                            SizedBox(height: height*0.009,),
                            Row(children: [
                              Image.asset(json[0]["image"],width: 60,height: 60,),
                              SizedBox(width: width*0.02),
                              Image.asset(json[1]["image"],width: 60,height: 60,),
                              SizedBox(width: width*0.02),
                              Image.asset(json[2]["image"],width: 60,height: 60,),
                              SizedBox(width: width*0.02),
                              Image.asset(json[3]["image"],width: 60,height: 60,),
                              SizedBox(width: width*0.02),
                              Image.asset(json[4]["image"],width: 60,height: 60,),
                            ],),
                            SizedBox(height: height*0.009,),
                            Text(json[i]["description"],style:TextStyle(fontSize: 15,color: Colors.grey)),
                            SizedBox(height: height*0.12,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                              child: Row(
                                children: [
                                  InkWell(child: CircleAvatar(child: Icon(CupertinoIcons.heart_fill,color: heartColor,),radius: 30,backgroundColor: Color.fromRGBO(247, 247, 247, 1),),
                                  onTap: (){
                                        setState(() {
                                          heartColor=Colors.red;
                                        });
                                  },),
                                  SizedBox(width: width*0.1,),
                                  InkWell(
                                    child: Container(
                                      width: width*0.50,
                                      height: height*0.07,
                                      decoration:BoxDecoration(
                                          color:Color.fromRGBO(13, 110, 240, 1),
                                          borderRadius: BorderRadius.circular(15  )

                                      ),
                                      child: Center(
                                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children:[
                                          Icon(CupertinoIcons.bag,color: Colors.white,),
                                          SizedBox(width: width*0.05,),
                                          Text("Add To Cart",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)
                                        ],),
                                      ),),
                                    onTap: ()
                                      {
                                        cart.add(json[currentIndex]);
                                        //cart[i]["image"]=json[currentIndex]["image"];
                                        //cart[i]["name"]=json[currentIndex]["name"];
                                        //cart[i]["price"]=json[currentIndex]["price"];
                                        Get.to(Carts());
                                      },
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
              }
      ),
          ),
        ],
      ),

    );
  }
}

