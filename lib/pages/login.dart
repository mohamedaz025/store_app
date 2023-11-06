// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/register.dart';
import 'package:store_app/shared/SnackBar.dart';
import 'package:store_app/shared/colors.dart';
import 'package:store_app/shared/contants.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

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
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33),
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
                    obscureText: isvisable? false: true,
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
                          "Sign in",
                          style: TextStyle(fontSize: 19),
                        ),
                ),
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
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
