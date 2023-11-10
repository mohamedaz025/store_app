// ignore_for_file: sort_child_properties_last, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_app/shared/contants.dart';

class Editdetails extends StatelessWidget {
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

  CollectionReference hotel = FirebaseFirestore.instance.collection('hotel');
  Future<void> editUser() {
    return hotel
        .doc(hotelname)

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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                    controller: namehotelcontroler,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your namehotel :  $hotelname ",
                        suffixIcon: Icon(Icons.hotel))),
                SizedBox(height: 20),
                TextField(
                    controller: link_img_1controler,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your link_img_1 :",
                        suffixIcon: Icon(Icons.image))),
                SizedBox(height: 20),
                TextField(
                    controller: link_img_2controler,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your link_img_2 :",
                        suffixIcon: Icon(Icons.image))),
                SizedBox(height: 20),
                TextField(
                    controller: locationHotelcontroler,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your locationHotel :",
                        suffixIcon: Icon(Icons.location_pin))),
                SizedBox(height: 20),
                TextField(
                    controller: starscontroler,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your stars :",
                        suffixIcon: Icon(Icons.star))),
                SizedBox(height: 20),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              editUser();
              print(hotelname);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              padding: MaterialStateProperty.all(EdgeInsets.all(12)),
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
