import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe/screen/editprofle/cubit/edit_profile_cubit.dart';
import '../const.dart';
import '../diohelper/urlapi.dart';
import 'cubit/profile_cubit.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isModified = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = ApiUrl.pro[0]['name']!;
    emailController.text = ApiUrl.pro[0]['email']!;
    phoneController.text = ApiUrl.pro[0]['phone']!;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void checkIfModified() {
    setState(() {
      isModified = nameController.text != ApiUrl.pro[0]['name'] ||
          emailController.text != ApiUrl.pro[0]['email'] ||
          phoneController.text != ApiUrl.pro[0]['phone'];
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: InkWell(
            onTap: () {
              context.read<ProfileCubit>().profile();
              Navigator.pop(context);
            },
            child: CircleAvatar(
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Color(0xff303030),
              ),
              backgroundColor: Color(0xffF7F7F9),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.05),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(picture1),
              ),
            ),
            SizedBox(height: height * 0.05),
            profiltxt(name: 'Your Name'),
            SizedBox(height: height * 0.01),
            TextFormField(
              controller: nameController,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onChanged: (value) => checkIfModified(),
            ),
            SizedBox(height: height * 0.01),
            profiltxt(name: 'Email Address'),
            SizedBox(height: height * 0.01),
            TextFormField(
              controller: emailController,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onChanged: (value) => checkIfModified(),
            ),
            SizedBox(height: height * 0.01),
            profiltxt(name: 'Phone'),
            SizedBox(height: height * 0.01),
            TextFormField(
              controller: phoneController,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onChanged: (value) => checkIfModified(),
            ),
            SizedBox(height: height * 0.05),
            Center(
              child: BlocBuilder<EditProfileCubit, EditProfileState>(
  builder: (context, state) {
    if(state is EditProfileLoading){
      return  const Center(
          child: CircularProgressIndicator(
            color: Color.fromARGB(255, 74, 84, 176),
          ));
    }
    return ElevatedButton(
                onPressed: isModified
                    ? () {

                  context.read<EditProfileCubit>().editprofile(name: nameController.text.trim(), phone: phoneController.text.trim(), email: emailController.text.trim());

if(state is EditProfileSucces) {

  setState(() {
    ApiUrl.pro[0]['name'] = nameController.text;
    ApiUrl.pro[0]['email'] = emailController.text;
    ApiUrl.pro[0]['phone'] = phoneController.text;
    isModified = false; // إعادة تعيين الحالة
  });

}


                }
                    : null,
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(
                      double.infinity, 0.17 * width),
                  minimumSize: Size(
                      double.infinity, 0.1 * width),
                  backgroundColor: isModified ? Color(0xff0D6EFD) : Colors.grey, // اللون
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              );
  },
),
            ),
          ],
        ),
      ),
    );
  }

  Widget profiltxt({required String name}) {
    return Text(
      name,
      style: TextStyle(
        color: Color(0xff2B2B2B),
        fontSize: 16,
      ),
    );
  }
}
