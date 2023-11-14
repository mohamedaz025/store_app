// ignore_for_file: unused_import, duplicate_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/firebase_options.dart';
import 'package:store_app/pages/home.dart';
import 'package:store_app/pages/login.dart';
import 'package:store_app/provirder/card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_app/shared/SnackBar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCe2gIyVd4chDpYAiTHpG3dWtcmYyj486Y",
            authDomain: "belquistours-893d9.firebaseapp.com",
            projectId: "belquistours-893d9",
            storageBucket: "belquistours-893d9.appspot.com",
            messagingSenderId: "82499568867",
            appId: "1:82499568867:web:f418dff8b083531b8e71d6",
            measurementId: "G-LN36VQ8JLW"));

  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return Cared();
        }),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeData.light(useMaterial3: true),
          // اسم صفحة البداية
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              } else if (snapshot.hasError) {
                return showSnackBar(context, "Something went wrong");
              }
              if (snapshot.hasData) {
                return const Home();
              } else {
                return const Login();
              }
            },
          )),
    );
  }
}
