import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nike_eco/screen/diohelper/diohelper.dart';
import 'package:nike_eco/screen/diohelper/urlapi.dart';
import 'package:nike_eco/screen/home/homescreen.dart';
import 'package:nike_eco/screen/login/model/LoginModel.dart';

import '../../dblocallog/hivo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  DioHelper _dioHelper=DioHelper();
  LoginModel loginModel=LoginModel();

  void login({ required String mail, required String password,})async{
    emit(LoginLoading());
    try {
      final response = await _dioHelper.postData(path: ApiUrl.login, body: {
        "email": mail,
        "password": password,
      });
      loginModel=LoginModel.fromJson(response.data);
      if(loginModel.status==true){
        Storagedata.addtoken(loginModel.data?.token??"");
        DioHelper.headers['Authorization']=loginModel.data?.token??"";
        Get.offAll(HomeScreen());

        emit(LoginSucess());
      }
      else{
        Get.snackbar('','',backgroundColor: Colors.red ,colorText: Colors.red
          ,messageText:  Text(loginModel.message??"",style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
            //textAlign: TextAlign.center,
          ),
         titleText: Text('⚠️Wrong',style: TextStyle(
           color: Colors.black,
           fontSize: 16,
         ),
           //textAlign: TextAlign.center,
         ),

        );
        emit(LoginErorr());
      }

    }
    catch(e){
      print("###############################${e}");
      emit(LoginErorr());
    }
  }
}
