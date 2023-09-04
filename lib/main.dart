import 'package:flutter/material.dart';
import 'package:nike_eco/screen/onbording/onbording.dart';
import 'package:nike_eco/screen/onbording/page1.dart';
import 'package:nike_eco/screen/onbording/page2.dart';
import 'package:nike_eco/screen/onbording/page3.dart';
import 'package:nike_eco/screen/splach.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: SplachScreen(),
    );
  }
}
