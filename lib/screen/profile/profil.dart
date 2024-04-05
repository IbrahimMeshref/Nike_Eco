import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../const.dart';
import '../diohelper/urlapi.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
       appBar:AppBar(
         backgroundColor: Colors.white,
          bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Profile",style:TextStyle(fontSize: 19,color:Colors.black),),
          leading: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child:InkWell(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {});
                },
                child: CircleAvatar
                  (child: Icon( Icons.arrow_back_ios_outlined,color: Color(0xff303030),),
                  backgroundColor: Color(0xffF7F7F9),),

              )
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
               Center(
                  child: CircleAvatar (
                radius: 60,
                 backgroundImage: NetworkImage( picture1),
              )),
              SizedBox(
                height: height * 0.05,
              ),
              profiltxt(name: 'Your Name'),
              SizedBox(
                height: height * 0.02,
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  hintText: ApiUrl.pro[0]['name'],
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                  // Adjust the vertical padding here
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              profiltxt(name: 'Email Address'),
              SizedBox(
                height: height * 0.02,
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  hintText:  ApiUrl.pro[0]['email'],
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                  // Adjust the vertical padding here
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              profiltxt(name: 'Phone'),
              SizedBox(
                height: height * 0.02,
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  hintText:ApiUrl.pro[0]['phone'],
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                  // Adjust the vertical padding here
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget profiltxt({required String name}) {
    return Text(
      name,
      style: TextStyle(
        color: Color(0xff2B2B2B),
        fontSize: 19,
      ),
    );
  }
}
