import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/shared/red_dada_from_fierstor.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}
final credential = FirebaseAuth.instance.currentUser;
CollectionReference users = FirebaseFirestore.instance.collection('uesers');

class _MyWidgetState extends State<MyWidget> {
  int ddd = 3;
  hhhhh(Map data,dynamic mykey) {



  }

  void initState() {
    // TODO: implement initState
    super.initState();
  
    // هنا نكتب الفونكشون عند بدء التشغيل
  }

  @override
  Widget build(BuildContext context) {
    Stream collectionStream =
        FirebaseFirestore.instance.collection('users').snapshots();

    return Scaffold(
        appBar: AppBar(title: Text("sdsadfsaf")),
        body: SizedBox(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: ddd,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: 200,
                  ),
                );
              }),
        ));
  }
}
