import 'package:flutter/material.dart';
class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
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

    );
  }
}
