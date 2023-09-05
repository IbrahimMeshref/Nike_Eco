import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nike_eco/screen/login/cubit/signin_cubit.dart';
import 'package:nike_eco/screen/login/widgest/txtfeild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          right: 40,
          left: 40,
          top: 100,
          bottom: 20,
        ),
        child: GestureDetector(
          onTap: FocusScope
              .of(context)
              .unfocus,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 120,
                      width: 120,
                      child: Image.asset("assets/images/logo3.png")),
                  SizedBox(
                    height: height * .02,
                  ),
                  Text(
                    "Welcome to our",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "E-Grocery",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  CustomTextField(height: height,
                      text: "Email",
                      controller: _emailController, validator: (value) {
                        setState(() {

                        });
                        return null;
                      }),
                  SizedBox(
                    height: height * .05,
                  ),
                  CustomTextField(
                      height: height,
                      text: "Password",
                      controller: _passwordController,
                      isPassword: _obscureText),

                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forget Password?"),
                    ],
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  BlocBuilder<SigninCubit, SigninState>(
                    builder: (context, state) {
                      if (state is SigninLoadingState) {
                        return Center(child: CircularProgressIndicator(),);
                      }
                      return InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SigninCubit>().login(
                              email: _emailController.text,
                              password: _passwordController.text,);
                            // Get.offAll(MainScreen());
                          }
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(16),
                          elevation: 10,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(16)),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have account?"),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(SignUpScreen());
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required double height,
    required String text,
    String? Function(String?)? validator,
    required TextEditingController controller,
    bool? isPassword,
  }) {
    print("is password (1): " + isPassword.toString());
    return Column(
      children: [
      Row(
      children: [
      Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ),
    ),
    ],
    ),
    SizedBox(
    height: height * .01,
    ),
    TextFormField(
    controller: controller,
    validator: validator,
    obscureText: isPassword ?? false,
    decoration: InputDecoration(
    filled: true,
    fillColor: Colors.grey[200],
    contentPadding: EdgeInsets.all(12),
    border: OutlineInputBorder(borderSide: BorderSide.none),
    suffixIcon: isPassword != null
    ? InkWell(
    onTap: () {
    isPassword = !isPassword!;
    print("===============isPassword: " +
    isPassword.toString());
    setState(() {});
    },
    child: isPassword==true ? Icon(CupertinoIcons.eye_fill):Icon(CupertinoIcons.eye_slash_fill),
    ) : null,
    ),
    ),
      ],
    );
  }
}