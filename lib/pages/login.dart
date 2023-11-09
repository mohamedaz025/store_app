// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/ForgetPassword.dart';
import 'package:store_app/pages/register.dart';
import 'package:store_app/provirder/google_Login.dart';
import 'package:store_app/shared/SnackBar.dart';
import 'package:store_app/shared/colors.dart';
import 'package:store_app/shared/contants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoding = false;
  bool isvisable = false;

  loginfun() async {
    setState(() {
      isLoding = true;
    });

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "Error :  ${e.code}");

      setState(() {
        isLoding = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbarGreen,
          title: Text("Log in"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "Enter Your email :",
                          suffixIcon: Icon(Icons.email))),
                  const SizedBox(height: 20),
                  TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: isvisable ? false : true,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "Enter Your password :",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  //  عكس القيمة تغير لاظهار الباسورد
                                  isvisable = !isvisable;
                                });
                              },
                              // تغير شكل ايكونة الباسورد علي حسب متغير
                              icon: isvisable
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off)))),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await loginfun();
                      // if (!mounted) return;
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(BTNgreen),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(12)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                    child: isLoding
                        ? CircularProgressIndicator(
                            color: const Color.fromARGB(255, 243, 13, 13),
                          )
                        : Text(
                            "Log in",
                            style: TextStyle(fontSize: 19),
                          ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              // اسم الصفحه المراد الوصل اليها
                              builder: (context) => Forgetpassword()),
                        );
                      },
                      child: Text("Forget Password",
                          style: TextStyle(
                              fontSize: 19,
                              decoration: TextDecoration.underline))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Do not have account?",
                          style: TextStyle(fontSize: 18)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                // اسم الصفحه المراد الوصل اليها
                                builder: (context) => Register()),
                          );
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 19,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  SizedBox(
                    width: 299,
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 0.6,
                          color: Colors.purple[900],
                        )),
                        Text(
                          "OR",
                          style: TextStyle(
                            color: Colors.purple[900],
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 0.6,
                          color: Colors.purple[900],
                        )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: GestureDetector(
                      onTap: () {
                        // googlelogInProvider.googlelogin();
                      },
                      child: Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.purple, width: 2)),
                        child: SvgPicture.asset(
                          "assets/icons/google.svg",
                          // color: Colors.purple[400],
                          height: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
