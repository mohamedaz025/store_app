// ignore_for_file: non_constant_identifier_names, sort_child_properties_last, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/hotel_data_widgets_Hurghada.dart';


class HotelHurghada extends StatefulWidget {
  const HotelHurghada({super.key});

  @override
  State<HotelHurghada> createState() => _HotelHurghadaState();
}

class _HotelHurghadaState extends State<HotelHurghada> {
  // تخذين الفير استور داخل متغير
  final _firestore = FirebaseFirestore.instance;
  // // تخذين الاميلات في متغير
  // // متغير من نوع يوزر لتخزين اليوزر المسجل بداخلة
  late User signedinuser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(title: const Text("hotel_Hurghada")),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // لعرض جدول من الفير استور كل سطر لوحده
          StreamBuilder<QuerySnapshot>(
              // بهذا الشكل نختار الجدول المراض عرضة
              stream: _firestore.collection('hotel_Hurghada').snapshots(),
              // قيمة بهذال الشكل
              builder: (context, snapshots) {
                // عمل ليست من نوع تيكست

                List<HohelDataHurghada> hotelwidgetslestHurghada = [];
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
                  final link_img_1 = hotel.get('link_img_1');
                  final link_img_2 = hotel.get('link_img_2');
                  final locationHotel = hotel.get('locationHotel');
                  final stars = hotel.get('stars');

                  final hotelwidgeteAddToList = HohelDataHurghada(
                      linkImg1: link_img_1,
                      linkImg2: link_img_2,
                      locationHotel: locationHotel,
                      stars: stars,
                      hotelname: hotelnames);

                  // اضافو لاعناصر داخل الليست
                  hotelwidgetslestHurghada.add(hotelwidgeteAddToList);
                }

                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    children: hotelwidgetslestHurghada,
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
