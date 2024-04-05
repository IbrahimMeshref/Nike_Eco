import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../dblocallog/hivo.dart';
import '../../diohelper/diohelper.dart';
import '../../diohelper/urlapi.dart';
import '../model/ProfileModel.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  DioHelper _dioHelper=DioHelper();
  ProfileModel profileModel=ProfileModel();

  void profile()async{
    if(StoragedataLogin.gettoken().isNotEmpty){
      final response = await _dioHelper.getData(path: ApiUrl.profile);
      print('66666666666666666666666666666666');
      print(response.data.toString());
      profileModel=ProfileModel.fromJson(response.data);
      print(profileModel.data?.phone);
      ApiUrl.pro.clear();
      ApiUrl.pro.add( {
        'name':profileModel.data!.name.toString(),
        'email':profileModel.data!.email.toString(),
        'phone':profileModel.data!.phone.toString(),
      });
     // Profileee(name:profileModel.data!.name.toString(),email:profileModel.data!.email.toString(),phone:profileModel.data!.phone.toString()  );
      //Profileee(name: );
     // Profileee(phone:profileModel.data!.name!, name: '', email: '' )
    }
  }
}
