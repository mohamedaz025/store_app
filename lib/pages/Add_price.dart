// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_app/shared/contants.dart';
import 'package:intl/intl.dart';

class Addprice extends StatefulWidget {
  String hotelname;
  Addprice({super.key, required this.hotelname});

  @override
  State<Addprice> createState() => _AddpriceState();
}

class _AddpriceState extends State<Addprice> {
  DateTime date = DateTime.now();

  final dateinController = TextEditingController();
  final dateouteontroller = TextEditingController();
  final pricesingleController = TextEditingController();
  final pricedoubleController = TextEditingController();
  final pricetripleController = TextEditingController();
  final pricechild1Controller = TextEditingController();
  final pricechild2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ِAdd price")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
        
              children: [
                Text(widget.hotelname,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900),),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 160,
                      child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: dateinController,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          decoration: decorationtextfiled.copyWith(
                              hintText: "Enter date in :",
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    DateTime? selctedate = await showDatePicker(
                                        context: context,
                                        initialDate: date,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2200));
                                    if (selctedate == null) return;
                                    setState(() {
                                      dateinController.text =
                                          DateFormat('yyy-MM-dd')
                                              .format(selctedate);
                                    });
                                  },
                                  icon: Icon(Icons.date_range,
                                      color: Colors.blue)))),
                    ),
                    Container(
                      width: 160,
                      child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: dateouteontroller,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          decoration: decorationtextfiled.copyWith(
                              hintText: "Enter date out:",
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    DateTime? selctedate = await showDatePicker(
                                        context: context,
                                        initialDate: date,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2200));
                                    if (selctedate == null) return;
                                    setState(() {
                                      dateouteontroller.text =
                                          DateFormat('yyy-MM-dd')
                                              .format(selctedate);
                                    });
                                  },
                                  icon: Icon(Icons.date_range,
                                      color: Colors.blue)))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: pricesingleController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your price single :",
                        suffixIcon: Icon(
                          Icons.price_change,
                          color: Colors.amber,
                        ))),
                SizedBox(height: 20),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: pricedoubleController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your price double:",
                        suffixIcon: Icon(
                          Icons.price_change,
                          color: Colors.amber,
                        ))),
                SizedBox(height: 20),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: pricetripleController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your price triple:",
                        suffixIcon: Icon(
                          Icons.price_change,
                          color: Colors.amber,
                        ))),
                SizedBox(height: 20),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: pricechild1Controller,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your price child1:",
                        suffixIcon: Icon(
                          Icons.price_change,
                          color: Colors.amber,
                        ))),
                SizedBox(height: 20),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: pricechild2Controller,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your price child2:",
                        suffixIcon: Icon(
                          Icons.price_change,
                          color: Colors.amber,
                        ))),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
        
                    CollectionReference users =
                        FirebaseFirestore.instance.collection(widget.hotelname);
        
                    users
                        .doc(dateinController.text)
                        .set({
                          'datein': dateinController.text,
                          'dateout': dateouteontroller.text,
                          'pricesingle': pricesingleController.text,
                          'pricedouble': pricedoubleController.text,
                          'pricetriple': pricetripleController.text,
                          'pricechild1': pricechild1Controller.text,
                          'pricechild2': pricechild2Controller.text,
                        })
                        .then((value) => print("User Added"))
                        .catchError(
                            (error) => print("Failed to add user: $error"));
                            
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: Text(
                    "click here",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
