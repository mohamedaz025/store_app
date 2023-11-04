// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:store_app/pages/register.dart';
import 'package:store_app/shared/colors.dart';
import 'package:store_app/shared/contants.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(33),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your email :")),
                const SizedBox(height: 20),
                TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your password :")),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(BTNgreen),
                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do not have account?",
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
                        child: Text('sign up',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20))),
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
