// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/belquistours-893d9.appspot.com/o/1.jpg?alt=media&token=887fb2aa-27c6-437a-9790-0357a9ee953f',
  'https://firebasestorage.googleapis.com/v0/b/belquistours-893d9.appspot.com/o/2.jpg?alt=media&token=4b9a155b-c387-4ee3-a108-57c70f5a328f',
'https://firebasestorage.googleapis.com/v0/b/belquistours-893d9.appspot.com/o/3.jpg?alt=media&token=e8e4e7ab-93da-4175-ad67-0c1396565120',
'https://firebasestorage.googleapis.com/v0/b/belquistours-893d9.appspot.com/o/4.jpg?alt=media&token=eea73470-7513-4c2f-a0a8-f62ee4ac5c51',
'https://firebasestorage.googleapis.com/v0/b/belquistours-893d9.appspot.com/o/5.jpg?alt=media&token=4160e802-8176-446f-a7b4-7ae17791b911',
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 254, 253, 253),
                ),
                // margin: EdgeInsets.all(10),
                //  height: 200,
                //
                child: ListView(
                  children: [
                    CarouselSlider(
                      items: imgList
                          .map((item) => Container(
                            padding: EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Image.network(
                                    item,
                                    fit: BoxFit.cover,
                                    width: 1000,
                                  ),
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, top: 8),
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "الفنادق الاكثر مبيعا",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          )),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 7, 131, 233),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 200,
                            child: Text(
                              "7",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900),
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 75, 233, 7),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          SizedBox(width: 10),
                          //
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 200,
                              height: 200,
                              child: Text(
                                "8",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w900),
                              ),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 229, 7, 233),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 200,
                      color: const Color.fromARGB(255, 222, 41, 28),
                      child: Text(
                        "3",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 200,
                      color: const Color.fromARGB(255, 210, 194, 48),
                      child: Text(
                        "4",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 100,
                      color: const Color.fromARGB(255, 22, 230, 29),
                      child: Text(
                        "5",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 0),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 142, 170, 193),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              // backgroundColor: colorOnPrimary,
                              // set this when inner content overflows, making RoundedRectangleBorder not working as expected
                              clipBehavior: Clip.antiAlias,
                              // set shape to make top corners rounded
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Container(
                                    height: 200,
                                  ),
                                );
                              });
                        },
                        icon: Icon(Icons.more_vert))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
