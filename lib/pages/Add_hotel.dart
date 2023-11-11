import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_app/shared/contants.dart';

class AddHotel extends StatelessWidget {
  AddHotel({super.key});

  final namehotel = TextEditingController();
  final linkImg1 = TextEditingController();
  final linkImg2 = TextEditingController();
  final locationHotel = TextEditingController();
  final stars = TextEditingController();
  final datein1 = "20";
  final dateout1 = "20";
  final price1 = "20";

  CollectionReference hotel = FirebaseFirestore.instance.collection('hotel');
  Future<void> addUser() {
    return hotel
        .doc(namehotel.text)
        .set({
          'namehotel': namehotel.text,
          'link_img_1': linkImg1.text,
          'link_img_2': linkImg2.text,
          'locationHotel': locationHotel.text,
          'stars': stars.text,
          'datein1': datein1,
          'dateout1': dateout1,
          'price1': price1,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

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
                      controller: linkImg1,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: decorationtextfiled.copyWith(
                          hintText: "Enter Your link_img_1 :",
                          suffixIcon: Icon(Icons.image))),
                  const SizedBox(height: 20),
                  TextField(
                      controller: linkImg2,
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
                      if (namehotel.text == "" ||
                          linkImg1.text == "" ||
                          linkImg2.text == "") {
                        namehotel.text = "?????????..";
                        linkImg1.text =
                            "https://firebasestorage.googleapis.com/v0/b/belquis-app.appspot.com/o/Error.jpg?alt=media&token=7dac7ee3-426a-469b-8e08-7c0775eeaa59";
                        linkImg2.text =
                            "https://firebasestorage.googleapis.com/v0/b/belquis-app.appspot.com/o/Error.jpg?alt=media&token=7dac7ee3-426a-469b-8e08-7c0775eeaa59";

                        addUser();
                        namehotel.clear();
                        linkImg1.clear();
                        linkImg2.clear();
                        locationHotel.clear();
                        stars.clear();
                      } else {
                        addUser();
                        namehotel.clear();
                        linkImg1.clear();
                        linkImg2.clear();
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

