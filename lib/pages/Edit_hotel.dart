// ignore_for_file: sort_child_properties_last, unnecessary_string_interpolations, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_app/shared/contants.dart';

class Editdetails extends StatefulWidget {
  String hotelname;
  String link_img1;
  String link_img_2;
  String stars;
  late String locationHote;

  Editdetails({
    super.key,
    required this.hotelname,
    required this.link_img1,
    required this.link_img_2,
    required this.stars,
    required this.locationHote,
  });
  @override
  State<Editdetails> createState() => _EditdetailsState();
}

class _EditdetailsState extends State<Editdetails> {
  CollectionReference hotel = FirebaseFirestore.instance.collection('hotel');

  Future<void> editUser() {
    return hotel
        .doc(widget.hotelname)
        .set({
          'namehotel': namehotelcontroler.text,
          'link_img_1': link_img_1controler.text,
          'link_img_2': link_img_2controler.text,
          'locationHotel': locationHotelcontroler.text,
          'stars': starscontroler.text,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showtext();
  }

  showtext() {
    namehotelcontroler.text = widget.hotelname;
    link_img_1controler.text = widget.link_img1;
    link_img_2controler.text = widget.link_img_2;
  }

  final namehotelcontroler = TextEditingController();

  final link_img_1controler = TextEditingController();

  final link_img_2controler = TextEditingController();

  final locationHotelcontroler = TextEditingController();

  final starscontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel_details Edit  "),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
           Padding(
             padding: const EdgeInsets.only(top: 15),
             child: Text(
                    "hotel name : ${widget.hotelname}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
           ),
          Padding(
            padding: const EdgeInsets.only(top: 20,right:20,left: 20 ),
            child: Column(
              children: [
               
                TextField(
                    controller: namehotelcontroler,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your namehotel : ${widget.hotelname}",
                        suffixIcon: const Icon(Icons.hotel))),
                const SizedBox(height: 20),
                TextField(
                    controller: link_img_1controler,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your link_img_1 :",
                        suffixIcon: const Icon(Icons.image))),
                const SizedBox(height: 20),
                TextField(
                    controller: link_img_2controler,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your link_img_2 :",
                        suffixIcon: const Icon(Icons.image))),
                const SizedBox(height: 20),
                TextField(
                    controller: locationHotelcontroler,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your locationHotel :",
                        suffixIcon: const Icon(Icons.location_pin))),
                const SizedBox(height: 20),
                TextField(
                    controller: starscontroler,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your stars :",
                        suffixIcon: const Icon(Icons.star))),
                const SizedBox(height: 20),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              editUser();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
            ),
            child: const Text(
              "Edit hotel ",
              style: TextStyle(fontSize: 19),
            ),
          ),
        ]),
      ),
    );
  }
}
