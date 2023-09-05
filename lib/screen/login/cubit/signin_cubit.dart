import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';
import 'package:nike_eco/screen/home/homescreen.dart';

import '../../helperdio/helperdio.dart';
import '../../helperdio/urlapi.dart';
import '../model/Modelsignin.dart';
import '../model/modelsignin.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());
  DioHelper _dioHelper = DioHelper();
  Modelsignin loginModel = Modelsignin();

  void login({
    required String email,
    required String password,
  }) async{
    emit(SigninLoadingState());
    try{
      final response = await _dioHelper.postData(
        path: ApiUrl.login,
        body: {
          "email": email,
          "password": password,
        },
      );
      loginModel= Modelsignin.fromJson(response.data);
      if(loginModel.status==true){
       /* HiveHelper.setToken(loginModel.data!.token!);
        DioHelper.headers["Authorization"]=loginModel.data?.token!;
        print("=====================================");
        print(loginModel.data?.token??"");*/
        Get.offAll(HomeScreen());
        emit(SigninSuccessState());
      }else{
        Get.snackbar("Error", loginModel.message??"",backgroundColor: Colors.red);
        emit(SigninErrorState());
      }


    }catch(e){
      print(e.toString());
      emit(SigninErrorState());
    }

  }



}
