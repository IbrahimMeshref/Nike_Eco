import 'package:SHOE/screen/diohelper/urlapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile/cubit/profile_cubit.dart';
import '../signup/signup.dart';
import 'cubit/login_cubit.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    if(state is LoginLoading) {
      return Stack(
        children: [
          Scaffold(
            appBar:AppBar(
                backgroundColor: Colors.transparent, elevation: 0
            ),
            backgroundColor: Colors.white,
            body:  Center(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.01),
                      Text(
                        'Hello Again!',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Fill Your Details Or Continue With',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        ' Social Media',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: height * 0.1),
                      Row(
                        children: [
                          Text(
                            'Email Address',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.01),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      if(state is LoginWrong) Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Api
                          Text(ApiUrl.message,style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFF0000),
                          ),
                          ),
                          //text wihtout Api
                          /*Text("Incorrect Email or Password, please try again",style: TextStyle(
                      fontSize: 14,
                      //fontWeight: FontWeight.bold,
                      color: Color(0xFFFF0000),
                    ),
                      // textAlign: TextAlign.center,
                    ),*/
                          SizedBox(height: height*0.04,),
                          //
                        ],
                      ),
                      // SizedBox(height: height*0.04),
                      ElevatedButton(
                        onPressed: () {
                          context.read<LoginCubit>().login(mail: _emailController.text, password: _passwordController.text);

                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          minimumSize: Size(double.infinity, 50.0),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.black),
                          ),
                          minimumSize: Size(double.infinity, 50.0),
                        ),
                        child: Container(
                          height: height*0.04,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50, // Adjust the width as needed
                                height: 50, // Adjust the height as needed
                                child: Image.asset("assets/images/icons/googleicon.png"),
                              ),
                              SizedBox(width: 16.0), // Add some spacing between the icon and text
                              Text(
                                'Sign In With Google',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),

            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  // Navigate to the signup page (main.dart)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  'New User? Create Account',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    // decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          Center(
              child: Container
                (
                  width: width,
                  color: Colors.transparent.withOpacity(0.2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.blueAccent,),
                      SizedBox(height: height*0.04,),
                      const Text('Loading...',
                        style:TextStyle(
                          fontSize: 19,
                          color: Colors.blueAccent,
                          decoration: TextDecoration.none,
                        ),)
                    ],
                  )

              )
          ),
        ],
      );
    }
    return Scaffold(
      appBar:AppBar(
          backgroundColor: Colors.transparent, elevation: 0
      ),
      backgroundColor: Colors.white,
      body:  Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.01),
                Text(
                  'Hello Again!',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Fill Your Details Or Continue With',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  ' Social Media',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: height * 0.1),
                Row(
                  children: [
                    Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.01),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.01,),
                if(state is LoginWrong) Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Api
                    Text(ApiUrl.message,style: TextStyle(
                fontSize: 14,
                 color: Color(0xFFFF0000),
             ),
                    ),
                    //text wihtout Api
                    /*Text("Incorrect Email or Password, please try again",style: TextStyle(
                      fontSize: 14,
                      //fontWeight: FontWeight.bold,
                      color: Color(0xFFFF0000),
                    ),
                      // textAlign: TextAlign.center,
                    ),*/
                    SizedBox(height: height*0.04,),
                    //
                  ],
                ),
               // SizedBox(height: height*0.04),
                ElevatedButton(
                  onPressed: () {
                    context.read<LoginCubit>().login(mail: _emailController.text, password: _passwordController.text);

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    minimumSize: Size(double.infinity, 50.0),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.black),
                    ),
                    minimumSize: Size(double.infinity, 50.0),
                  ),
                  child: Container(
                    height: height*0.04,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50, // Adjust the width as needed
                          height: 50, // Adjust the height as needed
                          child: Image.asset("assets/images/icons/googleicon.png"),
                        ),
                        SizedBox(width: 16.0), // Add some spacing between the icon and text
                        Text(
                          'Sign In With Google',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () {
            // Navigate to the signup page (main.dart)
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ),
            );
          },
          child: Text(
            'New User? Create Account',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
             // decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
