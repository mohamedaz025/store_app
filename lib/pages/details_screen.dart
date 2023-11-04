// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:store_app/model/item.dart';
import 'package:store_app/shared/colors.dart';

class Details extends StatefulWidget {
  Item prodact;
  Details({required this.prodact});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isshowmore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("details_screen"),
        actions: [
          Row(
            children: [
              Stack(
                children: [
                  Positioned(
                    bottom: 24,
                    child: Container(
                      child: Text(
                        "8",
                        style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(211, 164, 255, 193),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                          Icons.add_shopping_cart), // الاكشن تظهر علي اليمين
                      onPressed: () {}),
                ],
              ), //  لعمل ايكونه للضغط عليها

              Padding(
                padding: const EdgeInsets.only(
                  right: 12,
                ),
                child: Text(
                  "\$ 128",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.prodact.imgPath),
            SizedBox(
              height: 20,
            ),
            Text(
              "\$ ${widget.prodact.price}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    "daaa",
                    style: TextStyle(fontSize: 12),
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 192, 192),
                      borderRadius: BorderRadius.circular(4)),
                ),
                SizedBox(width: 11),
                Row(
                  children: [
                    Icon(Icons.star,
                        color: const Color.fromARGB(255, 255, 191, 0)),
                    Icon(Icons.star,
                        color: const Color.fromARGB(255, 255, 191, 0)),
                    Icon(Icons.star,
                        color: const Color.fromARGB(255, 255, 191, 0)),
                    Icon(Icons.star,
                        color: const Color.fromARGB(255, 255, 191, 0)),
                    Icon(Icons.star,
                        color: const Color.fromARGB(255, 255, 191, 0)),
                  ],
                ),
                SizedBox(width: 77),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.edit_location,
                      size: 26,
                      color: const Color.fromARGB(168, 3, 65, 27),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      widget.prodact.location,
                      style: TextStyle(fontSize: 19),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Text(
                "details_screen",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.start,
              ),
            ),
            Text(
              "To switch to a new route, use the Navigator.push() method. The push() method adds a Route to the stack of routes managed by the Navigator. Where does the Route come from? You can create your own, or use a MaterialPageRoute, which is useful because it transitions to the new route using a platform-specific animation.",
              style: TextStyle(fontSize: 29),
              maxLines: isshowmore ? 3 : null,
              overflow: TextOverflow.fade,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    //  عكس حالة المتغير
                    isshowmore = !isshowmore;
                  });
                },
                child: Text(
                  isshowmore ? "Show more" : "Show less",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
