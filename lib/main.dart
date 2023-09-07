import 'package:SHOE/screen/dblocallog/hivo.dart';
import 'package:SHOE/screen/diohelper/diohelper.dart';
import 'package:SHOE/screen/login/cubit/login_cubit.dart';
import 'package:SHOE/screen/profile/cubit/profile_cubit.dart';
import 'package:SHOE/screen/signup/cubit/sign_up_cubit.dart';
import 'package:SHOE/screen/splach/splach.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

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
          create: (context) => ProfileCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplachScreen(),
      ),
    );
  }
}
