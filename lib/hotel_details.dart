import 'package:flutter/material.dart';

class Hotel_details extends StatelessWidget {
  String hotel;
  String link_img1;
  String link_img_2;
  String stars;
  String price;
  Hotel_details(
      {super.key,
      required this.hotel,
      required this.link_img1,
      required this.link_img_2,
      required this.stars,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel_details  "),
      ),
      body: Column(
        children: [
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
            )
          ),


          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$hotel    $stars",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                Text("$price")
              ],
            ),
          )
        ],
      ),
    );
  }
}
