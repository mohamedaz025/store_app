import 'package:flutter/material.dart';
import 'package:store_app/shared/SnackBar.dart';
import 'package:store_app/shared/colors.dart';
import 'package:store_app/shared/contants.dart';

class Forgetpassword extends StatefulWidget {
  Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
   bool isLoding = false;
  final emailController = TextEditingController();
final _formKey = GlobalKey<FormState>();



  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text("Forget Password"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(33),
          child: Form(
            key:_formKey ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Enter your email to rest your password.",
                    style: TextStyle(fontSize: 18)),
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
                        suffixIcon: const Icon(Icons.email))),
                const SizedBox(height: 20),
          
          
          
                 ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            
                            
                            
                          } else {
                            showSnackBar(context, "Error");
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(BTNgreen),
                          padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                        ),
                        child:
                            //  عمل قاعدة ايف المختصرة علي متغير بولين اذاكان ترو ينفذ دائرة تحميل داخل الزر اذاكان فولس يكتب نص
                            isLoding
                                ? const CircularProgressIndicator(
                                    color: Color.fromARGB(255, 243, 13, 13),
                                  )
                                : const Text(
                                    "Reset password",
                                    style: TextStyle(fontSize: 19),
                                  ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
