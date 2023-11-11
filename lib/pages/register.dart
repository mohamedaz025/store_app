// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/login.dart';
import 'package:store_app/shared/SnackBar.dart';
import 'package:store_app/shared/colors.dart';
import 'package:store_app/shared/contants.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isvisable = true;
  final _formKey = GlobalKey<FormState>();
  bool isLoding = false;
  final usernameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool ispassword8char = false;
  bool ispasswordHas1number = false;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;

  onpasswordchanged(String password) {
    ispassword8char = false;
    ispasswordHas1number = false;
    hasUppercase = false;
    hasLowercase = false;
    hasSpecialCharacters = false;
    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        ispassword8char = true;
      }

      if (password.contains(RegExp(r'[0-9]'))) {
        ispasswordHas1number = true;
      }

      if (password.contains(RegExp(r'[A-Z]'))) {
        hasUppercase = true;
      }

      if (password.contains(RegExp(r'[a-z]'))) {
        hasLowercase = true;
      }

      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialCharacters = true;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    ageController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  register() async {
    setState(() {
      isLoding = true;
    });
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

//ارسال الداتا
      CollectionReference users =
          FirebaseFirestore.instance.collection('uesers');
      users
          .doc(credential.user!.uid)
          .set({
            'username': usernameController.text,
            'age': ageController.text,
            'email': emailController.text,
            'password': passwordController.text
          })
          .then((value) => print("user Added"))
          .catchError((error) => print("Failed to add user"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        // استدعاء شريط اشعرات من الاسفل وكتابة جمله بداخلة
        showSnackBar(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        showSnackBar(context, "The account already exists for that email.");
      } else {
        showSnackBar(context, "ERROR - Please try again late.");
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    setState(() {
      isLoding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("Register"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(33),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                      controller: usernameController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "Enter Your username :",
                          suffixIcon: Icon(Icons.person))),
                  const SizedBox(height: 20),
                  TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "Enter Your age :",
                          suffixIcon: Icon(Icons.pest_control_rodent))),
                  const SizedBox(height: 20),
                  TextFormField(
                      validator: (email) {
                        return email!.contains(RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                            ? null
                            : "Enter a valid email";
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "Enter Your email :",
                          suffixIcon: Icon(Icons.email))),
                  const SizedBox(height: 20),
                  TextFormField(
                      onChanged: (password) {
                        onpasswordchanged(password);
                      },
                      validator: (value) {
                        return value!.length < 8
                            ? "Enter at least 8 characters"
                            : null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: isvisable ? true : false,
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
                                  : Icon(Icons.visibility_off))
                                  )),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        child: Icon(Icons.check, color: Colors.white, size: 15),
                        decoration: BoxDecoration(
                            color:
                                ispassword8char ? Colors.green : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 189, 189, 189))),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text("At least 8 characters")
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        child: Icon(Icons.check, color: Colors.white, size: 15),
                        decoration: BoxDecoration(
                            color: ispasswordHas1number
                                ? Colors.green
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 189, 189, 189))),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text("At least 1 number")
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        child: Icon(Icons.check, color: Colors.white, size: 15),
                        decoration: BoxDecoration(
                            color: hasUppercase ? Colors.green : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 189, 189, 189))),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text("Has Uppercase")
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        child: Icon(Icons.check, color: Colors.white, size: 15),
                        decoration: BoxDecoration(
                            color: hasLowercase ? Colors.green : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 189, 189, 189))),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text("Has Lowercase")
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        child: Icon(Icons.check, color: Colors.white, size: 15),
                        decoration: BoxDecoration(
                            color: hasSpecialCharacters
                                ? Colors.green
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 189, 189, 189))),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text("Has Special Characters")
                    ],
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await register();

                        if (!mounted) return;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              // اسم الصفحه المراد الوصل اليها
                              builder: (context) => Login()),
                        );
                      } else {
                        showSnackBar(context, "Error");
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(BTNgreen),
                      padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                    child:
                        //  عمل قاعدة ايف المختصرة علي متغير بولين اذاكان ترو ينفذ دائرة تحميل داخل الزر اذاكان فولس يكتب نص
                        isLoding
                            ? CircularProgressIndicator(
                                color: const Color.fromARGB(255, 243, 13, 13),
                              )
                            : Text(
                                "Register",
                                style: TextStyle(fontSize: 19),
                              ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: TextStyle(fontSize: 18)),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  // اسم الصفحه المراد الوصل اليها
                                  builder: (context) => Login()),
                            );
                          },
                          child: Text('log in',
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline))),
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
}
