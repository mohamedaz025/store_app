
// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/ForgetPassword.dart';
import 'package:store_app/pages/register.dart';
import 'package:store_app/shared/SnackBar.dart';
import 'package:store_app/shared/colors.dart';
import 'package:store_app/shared/contants.dart';

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

  loginguest() async {
    setState(() {
      isLoding = true;
    });

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "guest@belquis.com",
        password: "12345678",
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

    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbarGreen,
          // ignore: prefer_const_constructors
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
                          suffixIcon: const Icon(Icons.email))),
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
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)))),
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
                        ? const CircularProgressIndicator(
                            color: Color.fromARGB(255, 243, 13, 13),
                          )
                        : const Text(
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
                              builder: (context) => const Forgetpassword()),
                        );
                      },
                      child: const Text("Forget Password",
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
                                builder: (context) => const Register()),
                          );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 19,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      loginguest();
                    },
                    child: const Text(
                      "Log in guest",
                      style: TextStyle(
                          fontSize: 19, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
