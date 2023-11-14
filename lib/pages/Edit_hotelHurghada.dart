
// ignore_for_file: must_be_immutable, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_app/shared/contants.dart';

class EditdetailsHurghada extends StatefulWidget {
  
  String hotelname;
  String linkimg1;
  String linkimg2;
  String stars;
  late String locationHote;

  EditdetailsHurghada({
    super.key,
    required this.hotelname,
    required this.linkimg1,
    required this.linkimg2,
    required this.stars,
    required this.locationHote,
  });
  
  @override
  State<EditdetailsHurghada> createState() => _EditdetailsHurghadaState();
}

class _EditdetailsHurghadaState extends State<EditdetailsHurghada> {




  @override
  void initState() {
    super.initState();
    showtext();
  }

  showtext() {
    linkimg1controler.text = widget.linkimg1;
    linkimg2controler.text = widget.linkimg2;
    locationHotelcontroler.text = widget.locationHote;
    starscontroler.text = widget.stars;
  }



  final linkimg1controler = TextEditingController();

  final linkimg2controler = TextEditingController();

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
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              children: [
                
                const SizedBox(height: 20),
                TextField(
                    controller: linkimg1controler,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your link_img_1 :",
                        suffixIcon: const Icon(Icons.image))),
                const SizedBox(height: 20),
                TextField(
                    controller: linkimg2controler,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationtextfiled.copyWith(
                        hintText: "Enter Your linkimg2 :",
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
              CollectionReference edithotel =
                  FirebaseFirestore.instance.collection('hotel_Hurghada');
              edithotel.doc(widget.hotelname).update({
                "stars": starscontroler.text,
                "link_img_1": linkimg1controler.text,
                "linkimg2": linkimg2controler.text,
                "locationHotel": locationHotelcontroler.text,
              });
              // editUser();
              Navigator.pop(context);
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
