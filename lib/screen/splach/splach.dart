import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_eco/screen/home/homescreen.dart';
import 'package:nike_eco/screen/onbording/onbording.dart';

import '../dblocallog/hivo.dart';
import '../onbording/page1.dart';
import '../profile/cubit/profile_cubit.dart';
class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
  
}


class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds:3),).then((value) => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>

    Storagedata.gettoken().isEmpty?
        Onbording():HomeScreen())),

    });
    if(Storagedata.gettoken().isNotEmpty) context.read<ProfileCubit>().profile();
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
          width: width*0.6,
          height: height*0.7,
          child: Image.asset('assets/images/logo.png') ,
        ),
      )
    );
  }
}
