import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF0995dc),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           Stack(
             children: [
               Container(
                 child: Image.asset('assets/images/onbording/Highlight1.png'),
                 width: width*0.08,
                 margin: EdgeInsets.only(top: height*0.15,left:width*0.19),

               ),
               Center(
                 child: Container(
                   child: Image.asset('assets/images/onbording/page1name.png'),
                   width: width*0.3,
                   margin: EdgeInsets.only(top: height*0.28,left:0),
                 ),
               ),
               Center(
                 child: Container(
                     width:width*0.5,
                     margin: EdgeInsets.only(top: height*0.18,left: 0),
                     child:Image.asset('assets/images/onbording/Wellcome.png')
                 ),
               ),
               Container(
                 child: Image.asset('assets/images/onbording/Ellipse1.png'),
                 width: width*0.5,
                 margin: EdgeInsets.only(top: height*0.62,left: width*0.15),
               ),
               Container(
                 child: Image.asset('assets/images/onbording/page1styel.png'),
                 width: width*0.8,
                 margin: EdgeInsets.only(top: height*0.22,left: width*0.14),
               ),
               Container(
                 child: Image.asset('assets/images/onbording/page1nike.png'),
                 width: width*0.9,
                 margin: EdgeInsets.only(top: height*0.13,left:width*0.1),

               ),
             /*  Container(
                 child: Image.asset('assets/images/onbording/watermark.png'),
                 width: width,
                 margin: EdgeInsets.only(top: height*0.53,left: 0),

               ),*/
             ],
           ),

          ],
        ),
      ),
    );
  }
}
