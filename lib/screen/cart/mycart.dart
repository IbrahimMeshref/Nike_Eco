import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../home/LocalDB.dart';
import '../home/itemscreen.dart';
class Carts extends StatefulWidget {
  const Carts({Key? key}) : super(key: key);

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
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
        title: Text("My Cart",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromRGBO(43, 43, 43, 1)),),
        leading: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child:InkWell(child: CircleAvatar(child: Icon(CupertinoIcons.arrow_left,color: Colors.grey,),backgroundColor: Color.fromRGBO(255, 255, 255, 1),),
              onTap: ()
              {
                Navigator.pop(context);
                setState(() {});
              },
            )
        ),
      ),
      body: ListView.separated(itemBuilder: (context,index)=>Dismissible(
        onDismissed: (val){
          cart.removeAt(index);
        },
        background: Container(
          height: height*0.12,
        ),
        secondaryBackground:Container(
          height: height*0.12,
          child: Icon(CupertinoIcons.delete),
            decoration: BoxDecoration(
                color: Colors.red,borderRadius:BorderRadius.circular(15)
            ),
        ),
        key: UniqueKey(),
        child: Container(
          width: width,
          height: height*0.12,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(15) ),
          child: Row(
            children: [
              Image.asset(cart[index]["image"],width: width*0.3,height: height*0.3,),
              SizedBox(width: width*0.08,),
              Column(
                children: [
                  Text(cart[index]["name"],style: TextStyle(fontSize: 20,color:Color.fromRGBO(43, 43, 43, 1))),
                  SizedBox(height: height*0.005),
                  Text(cart[index]["price"],style: TextStyle(fontSize: 20,color:Color.fromRGBO(43, 43, 43, 1))),

                ],
              )],
          ),
        ),
      ),  itemCount: cart.length,
        separatorBuilder :(BuildContext context, int index) => SizedBox(height: height*0.02,),scrollDirection: Axis.vertical,
      )



    );
  }
}
