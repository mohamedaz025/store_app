// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/model/item.dart';
import 'package:store_app/pages/details_screen.dart';
import 'package:store_app/pages/home.dart';
import 'package:store_app/pages/login.dart';
import 'package:store_app/pages/register.dart';
import 'package:store_app/provirder/card.dart';

void main() {
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
        home: Home(
        )
      ),
    );
  }
}
