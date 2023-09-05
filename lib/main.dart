import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_eco/screen/login/cubit/signin_cubit.dart';
import 'package:nike_eco/screen/onbording/onbording.dart';
import 'package:nike_eco/screen/onbording/page1.dart';
import 'package:nike_eco/screen/onbording/page2.dart';
import 'package:nike_eco/screen/onbording/page3.dart';
import 'package:nike_eco/screen/profile/profil.dart';
import 'package:nike_eco/screen/splach/splach.dart';
import 'screen/home/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => SigninCubit(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplachScreen(),
      ),
    );
  }
}
