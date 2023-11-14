
// ignore_for_file: file_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/hotel_data_widgets_AinSokhna.dart';

class hotel_AinSokhna extends StatefulWidget {
  const hotel_AinSokhna({super.key});

  @override
  State<hotel_AinSokhna> createState() => _hotel_AinSokhnaState();
}

class _hotel_AinSokhnaState extends State<hotel_AinSokhna> {
  // تخذين الفير استور داخل متغير
  final _firestore = FirebaseFirestore.instance;
  // // تخذين الاميلات في متغير
  // // متغير من نوع يوزر لتخزين اليوزر المسجل بداخلة
  late User signedinuser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // لعمل قائمة منيو من اليسار

      appBar: AppBar(title: const Text("hotel_AinSokhna")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // لعرض جدول من الفير استور كل سطر لوحده
          StreamBuilder<QuerySnapshot>(
              // بهذا الشكل نختار الجدول المراض عرضة
              stream: _firestore.collection('hotel_AinSokhna').snapshots(),
              // قيمة بهذال الشكل
              builder: (context, snapshots) {
                // عمل ليست من نوع تيكست

                List<HohelDataAinSokhna> hotelwidgetslest = [];
                if (!snapshots.hasData) {
                  return const Column(
                    children: [
                      CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                      ),
                    ],
                  );
                }
                final hohels = snapshots.data!.docs;
                for (var hotel in hohels) {
                  final hotelnames = hotel.get('namehotel');
                  final linkimg1 = hotel.get('linkimg1');
                  final linkimg2 = hotel.get('linkimg2');
                  final locationHotel = hotel.get('locationHotel');
                  final stars = hotel.get('stars');

                  final hotelwidgeteAddToList = HohelDataAinSokhna(
                      linkImg1: linkimg1,
                      linkImg2: linkimg2,
                      locationHotel: locationHotel,
                      stars: stars,
                      hotelname: hotelnames);

                  // اضافو لاعناصر داخل الليست
                  hotelwidgetslest.add(hotelwidgeteAddToList);
                }

                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    children: hotelwidgetslest,
                  ),
                );
              }),

          Container(
            height: 80,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 78, 116),
                border: Border.symmetric(horizontal: BorderSide())),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.home,
                                  size: 50,
                                  color: Colors.white,
                                )),
                            const SizedBox(height: 4),
                            const Text(
                              "      Home",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.hotel,
                            size: 50,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.airplanemode_active,
                            size: 50,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bus_alert_rounded,
                            size: 50,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 25),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        size: 50,
                        color: Color.fromARGB(90, 255, 255, 255),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
