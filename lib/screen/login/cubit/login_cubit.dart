import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';


import '../../dblocallog/hivo.dart';
import '../../diohelper/diohelper.dart';
import '../../diohelper/urlapi.dart';
import '../../home/homescreen.dart';
import '../../profile/model/ProfileModel.dart';
import '../model/LoginModel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  DioHelper _dioHelper=DioHelper();
  LoginModel loginModel=LoginModel();
  ProfileModel profileModel=ProfileModel();

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
        final response2 = await _dioHelper.getData(path: ApiUrl.profile);
        print('66666666666666666666666666666666lllloginnnnnnnn');
        print(response.data.toString());
        profileModel=ProfileModel.fromJson(response.data);
        print(profileModel.data?.phone);
        ApiUrl.pro.clear();
        ApiUrl.pro.add( {
          'name':profileModel.data!.name.toString(),
          'email':profileModel.data!.email.toString(),
          'phone':profileModel.data!.phone.toString(),
        });
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
