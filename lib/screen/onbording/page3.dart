import 'package:flutter/material.dart';
class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
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

    );
  }
}
