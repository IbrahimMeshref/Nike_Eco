import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../diohelper/diohelper.dart';
import '../../diohelper/urlapi.dart';
import 'model/edit_model.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  DioHelper _dioHelper = DioHelper();
  EditModel editModel = EditModel();
  Future<void> editprofile({required String name, required String phone ,required String email}) async {
    emit(EditProfileLoading());
    try{
      final response =await _dioHelper.putData(path: ApiUrl.editprofile,body: {
        "name": name,
        "phone": phone,
        "email": email,
        //"password": "123456789",
        "image": ""
      });
      print(response.data);
      editModel = EditModel.fromJson(response.data);
      if(editModel.status==true){
        emit(EditProfileSucces());
      }else{
        emit(EditProfileWrong());
      }

    }catch(e){
      emit(EditProfileError());
    }
  }
}
