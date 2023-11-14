// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, file_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/shared/contants.dart';

class Booknow extends StatefulWidget {
  String hotelname;
  String datein;
  String dateout;
  String pricesingle;
  String pricedouble;
  String pricetriple;
  String pricechild1;
  String pricechild2;
  Booknow(
      {super.key,
      required this.hotelname,
      required this.datein,
      required this.dateout,
      required this.pricesingle,
      required this.pricedouble,
      required this.pricetriple,
      required this.pricechild1,
      required this.pricechild2});

  @override
  State<Booknow> createState() => _BooknowState();
}

class _BooknowState extends State<Booknow> {
    final credential = FirebaseAuth.instance.currentUser;

  final personController = TextEditingController();
  final childController = TextEditingController();
  final numberController = TextEditingController();
  final notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book now")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "In : ${widget.datein}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "to",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "Out ${widget.dateout}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    widget.hotelname,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 20),
                  TextField(
                      controller: personController,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "Number of person",
                          labelText: "Number of person",
                          suffixIcon: Icon(Icons.person))),
                  SizedBox(height: 20),
                  TextField(
                      controller: childController,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "Number of child",
                          labelText: "Number of child",
                          suffixIcon: Icon(Icons.child_friendly))),
                  SizedBox(height: 20),
                  TextField(
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "phone number",
                          labelText: "phone number",
                          suffixIcon: Icon(Icons.phone))),
                  SizedBox(height: 20),
                  TextField(
                    controller: notesController,
                    //  لعمل مربع ادخال
                    obscureText: false, //  لجعل المدخلات مشفره
                    // keyboardType: TextInputType.number,   //  للتحكم في الكيبورد
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: "Enter notes:", // ملاحظه داحل التيكست فيلد
                      hintStyle: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 169, 9, 9)),
                      // labelText: "Enter notes:",     // ملاحظه اعلي التيكست فيلد
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 15),
                      // icon: Icon(Icons.email),    // لعمل ايكونه خارج التيكست فيلد
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: const Color.fromARGB(255, 255, 32, 7),
                    borderRadius: BorderRadius.circular(299)),
                child: TextButton.icon(
                    onPressed: () {
                      CollectionReference addBook =
                          FirebaseFirestore.instance.collection('Book');
                      addBook
                          // existing document in 'users' collection: "ABC123"
                          .doc('${credential!.email}')
                          .set(
                            {
                              'hotelname':widget.hotelname,
                              'datein':widget.datein,
                              'dateout':widget.dateout,
                              'Number_of_person': personController.text,
                             'Number_of_child': childController.text,
                             'phone_number':numberController.text,
                             'notes':notesController.text
                             
                             
                             },
                            SetOptions(merge: true),
                          )
                          .then((value) => print(
                              "'full_name' & 'age' merged with existing data!"))
                          .catchError(
                              (error) => print("Failed to merge data: $error"));
                    },
                    icon: Icon(
                      Icons.currency_bitcoin_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                    label: Text('Book Don',
                        style: TextStyle(color: Colors.white, fontSize: 30))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
