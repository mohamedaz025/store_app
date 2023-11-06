// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/firebase_options.dart';
import 'package:store_app/model/item.dart';
import 'package:store_app/pages/checkout.dart';
import 'package:store_app/pages/details_screen.dart';
import 'package:store_app/pages/home.dart';
import 'package:store_app/pages/login.dart';
import 'package:store_app/pages/register.dart';
import 'package:store_app/provirder/card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:store_app/shared/SnackBar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cared();
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeData.light(useMaterial3: true),
          // اسم صفحة البداية
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              } else if (snapshot.hasError) {
                return showSnackBar(context, "Something went wrong");
              }
              if (snapshot.hasData) {
                return Home();
              } else {
                return Login();
              }
            },
          )),
    );
  }
}
