
import 'package:flutter/material.dart';

import '../home/homescreen.dart';
import '../login/login_screen.dart';
import 'contentonbording.dart';
class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;late Color _color;int page=-1;int i=0;double?size1;double?size2;
  PageController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

     double width = MediaQuery.of(context).size.width;
     late double  height = MediaQuery.of(context).size.height ;
     List<Widget>contents=[
       Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Stack(
               children: [
                 Column(
                   children: [
                     SizedBox(width: width*0.45,height: height*0.14,),
                     Container(
                       child: Image.asset('assets/images/onbording/Highlight1.png',width: width*0.07,height: height*0.07,),

                     ),
                   ],
                 ),
                 Center(
                   child: Column(
                     children: [
                       SizedBox(height: height*0.07,),
                       Container(
                         child: Image.asset('assets/images/onbording/page1name.png',width: width*0.37,height: height*0.37,),
                         //width: width*0.3,
                         //margin: EdgeInsets.only(top: height*0.24),
                       ),
                     ],
                   ),
                 ),
                 Center(
                   child: Column(
                     children: [
                       Padding(padding: EdgeInsets.only(bottom: height-height)),
                       Container(
                           //width:width*0.5,
                           //margin: EdgeInsets.only(top: height*0.18,left: width*0.02),
                           child:Image.asset('assets/images/onbording/Wellcome.png',)
                       ),
                     ],
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
       Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Stack(
               children: [
                 Container(
                   child: Image.asset('assets/images/onbording/hightlight1page2.png'),
                   width: width*0.12,
                   margin: EdgeInsets.only(top: height*0.12,left:width*0.8),
                 ),
                 Container(
                   child: Image.asset('assets/images/onbording/hightlight2page2.png'),
                   width: width*0.30,
                   margin: EdgeInsets.only(top: height*0.14,left:width*0.01),
                 ),
                 Container(
                   child: Image.asset('assets/images/onbording/nike2.png'),
                   width: width*0.90,
                   margin: EdgeInsets.only(top: height*0.14,left:width*0.01),
                 ),
                 Container(
                   child: Image.asset('assets/images/onbording/Ellipse2.png'),
                   width: width*0.62,
                   margin: EdgeInsets.only(top: height*0.45,left:width*0.12),
                 ),
                 Center(
                   child: Container(
                       width:width*0.82,
                       margin: EdgeInsets.only(top: height*0.56,left: 0),
                       child:Image.asset('assets/images/onbording/txtpage2.png')
                   ),
                 ),
                 /*   Container(
                  child: Image.asset('assets/images/onbording/watermark.png'),
                  width: width,
                  margin: EdgeInsets.only(top: height*0.53,left: 0),
                ),*/
                 Padding(
                   padding: const EdgeInsets.all(60),
                   child: Container(
                     child: Text('Smart, Gorgeous & Fashionable Collection Explore Now',
                       style: TextStyle(
                           fontSize: 19,
                           color: Color(0xFFD8D8D8)
                       ),
                       textAlign: TextAlign.center,
                     ),
                     width: width,
                     margin: EdgeInsets.only(top: height*0.62,left: 0),
                   ),
                 ),
               ],
             ),

           ],
         ),
       ),
       Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Stack(
               children: [
                 Container(
                   child: Image.asset('assets/images/onbording/hightlight1page3.png'),
                   width: width*0.22,
                   margin: EdgeInsets.only(top: height*0.12,left:width*0.10),
                 ),
                 Container(
                   child: Image.asset('assets/images/onbording/nike3.png'),
                   width: width*0.90,
                   margin: EdgeInsets.only(top: height*0.08,left:width*0.03),
                 ),
                 Container(
                   child: Image.asset('assets/images/onbording/vector3.png'),
                   width: width*0.82,
                   margin: EdgeInsets.only(top: height*0.21,left:width*0.09),
                 ),
                 Center(
                   child: Container(
                       width:width*0.65,
                       margin: EdgeInsets.only(top: height*0.55,left: 0),
                       child:Image.asset('assets/images/onbording/txt3.png')
                   ),
                 ),
                 /*Container(
                  child: Image.asset('assets/images/onbording/watermark.png'),
                  width: width,
                  margin: EdgeInsets.only(top: height*0.53,left: 0),
                ),*/
                 Padding(
                   padding: const EdgeInsets.all(10),
                   child: Container(
                     child: Text('There Are Many Beautiful And Attractive Plants To Your Room',
                       style: TextStyle(
                           fontSize: 19,
                           color: Color(0xFFD8D8D8)
                       ),
                       textAlign: TextAlign.center,
                     ),
                     width: width,
                     margin: EdgeInsets.only(top: height*0.68,left: 0),
                   ),
                 ),
               ],
             ),

           ],
         ),
       ),

     ];

    return Scaffold(
      backgroundColor: Color(0xFF0995dc),
      body:  SingleChildScrollView(
        child: Stack(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                 // margin: EdgeInsets.only(top: height*0.53),
                  child: Column(
                    children: [
                      SizedBox(height: height*0.53,),
                      Image.asset('assets/images/onbording/watermark.png'),
                    ],
                  )
              ),
              //  width: height,
               // padding: EdgeInsets.only(top: height*0.53),

              //SizedBox(height: 50,),
              Center(
                child: Container(
                  height: height*0.067,
                  width: width*0.9,
                  margin: EdgeInsets.only(top: height*0.9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Color(0xD4E0EAEE),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if(currentIndex+1==contents.length) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => LoginScreen(),
                                  ),
                                );
                              }
                              _controller?.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);

                            });
                          },
                          child:Container(
                              height: height*0.067,
                              width: width*0.9,
                              //margin: EdgeInsets.only(top: height*0.9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color(0xD4E0EAEE),
                              ),
                              child:Center(
                                child: Text(currentIndex!=contents.length-1?'Next':'Get Started',style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              )
                          ),
                        ),
                      ]
                  ),
                ),
              ),
              Container(
              height: height*0.9,

                child: PageView.builder(
                  controller: _controller,
                  itemCount:contents.length,
                  onPageChanged: (int index) { currentIndex = index;
                    setState(() {
                    });
                  },
                  itemBuilder: (context,index)
                  {
                   // index=indexx;
                    //indexx++;
                   // index=indexx;
                    return contents[index];
                  }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height*0.80,left: width*0.4),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      contents.length,
                          (index) => buildborder(index, context),
                    ),

                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }


  Widget buildborder(int index, BuildContext context) {

    currentIndex == index ?  _color=Colors.white : _color=Colors.amber;

    return InkWell(
      onTap: () {
        setState(() {
        });
      },
      child: Container(
        height: 5,
        width: currentIndex == index ? 30 : 20,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:_color,
        ),

      ),
    );
  }


}

