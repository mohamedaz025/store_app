// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:store_app/shared/colors.dart';
import 'package:store_app/shared/data_Fromuser_fierstor.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final credential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: appbarGreen,
        title: Text("Profile Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "Info from",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ))),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      "Email: ${credential!.email} ",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      //

                      "Created date:   ${DateFormat("yyy-MM-dd").format(credential!.metadata.creationTime!)}   ",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      //
                      "Last Signed In: ${DateFormat("yyy-MM-dd").format(credential!.metadata.lastSignInTime!)}  ",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              //  ربط بيوزر المسجل
              GetdataFromfierstor(
                documentId: credential!.uid,
              )
            ],
          ),
        ),
      ),
    );
  }
}
