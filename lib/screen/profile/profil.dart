import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../const.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: CircleAvatar(
                      radius: 25,
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Color(0xff2B2B2B),
                      ),
                      backgroundColor: Color(0xffF7F7F9),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.25,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: Color(0xff2B2B2B),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                  child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(picture1),
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
                  hintText: ' Ibrahim Meshref',
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
                  hintText: ' ibrahimmohamedmeshref@gmail.com',
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
                  hintText: ' 01096113327',
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
