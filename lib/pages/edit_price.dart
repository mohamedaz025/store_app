// ignore_for_file: must_be_immutable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:store_app/shared/contants.dart';

class Editprice extends StatefulWidget {
  String hotelname;
  String datein;
  String dateout;
  String pricesingle;
  String pricedouble;
  String pricetriple;
  String pricechild1;
  String pricechild2;
  Editprice({super.key, required this.hotelname, 
  required this.datein,
  required this.dateout,
  required this.pricesingle,
  required this.pricedouble,
  required this.pricetriple,
  required this.pricechild1,
   required this.pricechild2
  });
  @override
  State<Editprice> createState() => _EditpriceState();
}

class _EditpriceState extends State<Editprice> {
  DateTime date = DateTime.now();

  @override
  void initState() {

    super.initState();
    showtext();
  }

  showtext() {
    dateinController.text = widget.datein;
    dateouteontroller.text = widget.dateout;
    pricesingleController.text = widget.pricesingle;
    pricedoubleController.text = widget.pricedouble;
    pricetripleController.text = widget.pricetriple;
    pricechild1Controller.text = widget.pricechild1;
    pricechild2Controller.text = widget.pricechild2;
  }

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
        appBar: AppBar(title: const Text("Edit price")),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  widget.hotelname,
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
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
                                  icon: const Icon(Icons.date_range,
                                      color: Colors.blue)))),
                    ),
                    SizedBox(
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
                                  icon: const Icon(Icons.date_range,
                                      color: Colors.blue)))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: pricesingleController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your price single :",
                        suffixIcon: const Icon(
                          Icons.price_change,
                          color: Colors.amber,
                        ))),
                const SizedBox(height: 20),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: pricedoubleController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your price double:",
                        suffixIcon: const Icon(
                          Icons.price_change,
                          color: Colors.amber,
                        ))),
                const SizedBox(height: 20),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: pricetripleController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your price triple:",
                        suffixIcon: const Icon(
                          Icons.price_change,
                          color: Colors.amber,
                        ))),
                const SizedBox(height: 20),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: pricechild1Controller,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your price child1:",
                        suffixIcon: const Icon(
                          Icons.price_change,
                          color: Colors.amber,
                        ))),
                const SizedBox(height: 20),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: pricechild2Controller,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your price child2:",
                        suffixIcon: const Icon(
                          Icons.price_change,
                          color: Colors.amber,
                        ))),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
          // ............................................................................
                    CollectionReference editPrice =
                        FirebaseFirestore.instance.collection(widget.hotelname);
          
                    editPrice
                        .doc(dateinController.text)
                        .update({
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
                        Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: const Text(
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
