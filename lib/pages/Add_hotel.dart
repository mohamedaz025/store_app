import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_app/shared/contants.dart';

class AddHotel extends StatelessWidget {
  AddHotel({super.key});

  CollectionReference hotel = FirebaseFirestore.instance.collection('hotel');

  Future<void> addUser() {
    return hotel
        .doc(namehotel.text)
        .set({
          'namehotel': namehotel.text,
          'link_img_1': link_img_1.text,
          'link_img_2': link_img_2.text,
          'locationHotel': locationHotel.text,
          'stars': stars.text,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  final namehotel = TextEditingController();
  final link_img_1 = TextEditingController();
  final link_img_2 = TextEditingController();
  final locationHotel = TextEditingController();
  final stars = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddHotel"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  TextField(
                      controller: namehotel,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "Enter Your namehotel :",
                          suffixIcon: Icon(Icons.hotel))),
                  const SizedBox(height: 20),
                  TextField(
                      controller: link_img_1,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "Enter Your link_img_1 :",
                          suffixIcon: Icon(Icons.image))),
                  const SizedBox(height: 20),
                  TextField(
                      controller: link_img_2,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "Enter Your link_img_2 :",
                          suffixIcon: Icon(Icons.image))),
                  const SizedBox(height: 20),
                  TextField(
                      controller: locationHotel,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "Enter Your locationHotel :",
                          suffixIcon: Icon(Icons.location_pin))),
                  const SizedBox(height: 20),
                  TextField(
                      controller: stars,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "Enter Your stars :",
                          suffixIcon: Icon(Icons.star))),
                  const SizedBox(height: 20),
                  

                  ElevatedButton(
                    onPressed: () {
                      if (namehotel.text == "" || link_img_1.text =="" || link_img_2.text =="" ) {
                        namehotel.text = "?????????..";
                        link_img_1.text =
                            "https://firebasestorage.googleapis.com/v0/b/belquis-app.appspot.com/o/Error.jpg?alt=media&token=7dac7ee3-426a-469b-8e08-7c0775eeaa59";
                        link_img_2.text =
                            "https://firebasestorage.googleapis.com/v0/b/belquis-app.appspot.com/o/Error.jpg?alt=media&token=7dac7ee3-426a-469b-8e08-7c0775eeaa59";
                            
                        addUser();
                        namehotel.clear();
                        link_img_1.clear();
                        link_img_2.clear();
                        locationHotel.clear();
                        stars.clear();
                      } else {
                        addUser();
                        namehotel.clear();
                        link_img_1.clear();
                        link_img_2.clear();
                        locationHotel.clear();
                        stars.clear();
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                    child: const Text(
                      "Add hotel",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
