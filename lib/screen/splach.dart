import 'package:flutter/material.dart';
import 'package:nike_eco/screen/onbording/onbording.dart';

import 'onbording/page1.dart';
class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds:1),).then((value) => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Onbording())),
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF0D6EFD),
      body:Center(
        child: Container(
          width: width*0.4,
          height: height*0.5,
          child: Image.asset('assets/images/logo.png') ,
        ),
      )
    );
  }
}
