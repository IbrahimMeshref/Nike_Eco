
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:shoe/screen/dblocalcart/hivo.dart';
import 'package:shoe/screen/dblocallog/hivo.dart';
import 'package:shoe/screen/diohelper/diohelper.dart';
import 'package:shoe/screen/editprofle/cubit/edit_profile_cubit.dart';

import 'screen/home/homescreen.dart';
import 'screen/login/cubit/login_cubit.dart';
import 'screen/profile/cubit/profile_cubit.dart';
import 'screen/signup/cubit/sign_up_cubit.dart';
import 'screen/splach/splach.dart';

Future<void> main() async {

/*  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);*/
  await Hive.initFlutter();
  var box = await Hive.openBox(StoragedataLogin.login);
  var box2 = await Hive.openBox(StoragedataCart.cartt);
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context)

  {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
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
        BlocProvider(
          create: (context) => EditProfileCubit(),
        ),

      ],

      child: GetMaterialApp(

        theme: new ThemeData(
          primaryColor: Colors.blue,
          //primarySwatch: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,

        home: SplachScreen(),
      ),
    );
  }
}
