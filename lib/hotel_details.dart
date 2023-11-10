// ignore_for_file: sort_child_properties_last, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class Hotel_details extends StatelessWidget {
  String hotelname;
  String link_img1;
  String link_img_2;
  String stars;
  String Datein1;
  String Dateout1;
  String price1;
  late String locationHote;
  Hotel_details({
    super.key,
    required this.hotelname,
    required this.link_img1,
    required this.link_img_2,
    required this.stars,
    required this.Datein1,
    required this.Dateout1,
    required this.price1,
    required this.locationHote,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel_details  "),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: // لجعل الحواف مستديرة
                          BorderRadius.circular(25), // لجعل الحواف مستديرة
                      // BorderRadius.only(    //  لجعل حافة محددة مستديرة
                      // topRight: Radius.circular(100),
                      // topLeft: Radius.circular(0),
                      // bottomLeft: Radius.circular(0),
                      // bottomRight: Radius.circular(0)
                      // ),
                      child: Image.network(
                        //  لاضافة صورة من الحهاز
                        "$link_img1",
                        fit: BoxFit.cover,
                        height: 300,
                        width: 400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: // لجعل الحواف مستديرة
                          BorderRadius.circular(25), // لجعل الحواف مستديرة
                      // BorderRadius.only(    //  لجعل حافة محددة مستديرة
                      // topRight: Radius.circular(100),
                      // topLeft: Radius.circular(0),
                      // bottomLeft: Radius.circular(0),
                      // bottomRight: Radius.circular(0)
                      // ),
                      child: Image.network(
                        //  لاضافة صورة من الحهاز
                        "$link_img_2",
                        fit: BoxFit.cover,
                        height: 300,
                        width: 400,
                      ),
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Stars $stars",
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Row(
                  children: [
                    const Icon(Icons.location_pin, color: Colors.orange),
                    Text("$locationHote")
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("44fg56"),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 5, top: 10, right: 10, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date in: $Datein1 to ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "Date out: $Dateout1",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.orange),
                        padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                      ),
                      child: Text(
                        "click here $price1",
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
