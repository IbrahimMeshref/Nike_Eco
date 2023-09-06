import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nike_eco/screen/dblocallog/hivo.dart';
import 'package:nike_eco/screen/diohelper/diohelper.dart';
import 'package:nike_eco/screen/login/cubit/login_cubit.dart';
import 'package:nike_eco/screen/onbording/onbording.dart';
import 'package:nike_eco/screen/onbording/page1.dart';
import 'package:nike_eco/screen/onbording/page2.dart';
import 'package:nike_eco/screen/onbording/page3.dart';
import 'package:nike_eco/screen/profile/cubit/profile_cubit.dart';
import 'package:nike_eco/screen/profile/profil.dart';
import 'package:nike_eco/screen/signup/cubit/sign_up_cubit.dart';
import 'package:nike_eco/screen/splach/splach.dart';
import 'screen/home/homescreen.dart';

Future<void> main() async {


  await Hive.initFlutter();
  var box = await Hive.openBox(Storagedata.notesbox);
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..profile(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplachScreen(),
      ),
    );
  }
}
