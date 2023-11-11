// ignore_for_file: non_constant_identifier_names, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/hotel_details.dart';
import 'package:store_app/model/item.dart';
import 'package:store_app/pages/Add_hotel.dart';
import 'package:store_app/pages/Edit_hotel.dart';
import 'package:store_app/pages/Profile%20_page.dart';
import 'package:store_app/pages/checkout.dart';
import 'package:store_app/pages/details_screen.dart';
import 'package:store_app/pages/hotel_data_widgets.dart';

class HomeHotel extends StatefulWidget {
  const HomeHotel({super.key});






  @override
  State<HomeHotel> createState() => _HomeHotelState();
}




class _HomeHotelState extends State<HomeHotel> {
  // تخذين الفير استور داخل متغير
  final _firestore = FirebaseFirestore.instance;
  // // تخذين الاميلات في متغير
  final _auth = FirebaseAuth.instance;
  // // متغير من نوع يوزر لتخزين اليوزر المسجل بداخلة
  late User signedinuser;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // لعمل قائمة منيو من اليسار
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // لعمل مربع به اسم واميل وصوره خلفيه وصوره شخصيه
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/img/test.jpg"),
                    // لجعل الصوره تملاء المربع
                    fit: BoxFit.cover,
                  )),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/img/my.jpg"),
                  ),
                  accountName: Text("mohamedtarek"),
                  accountEmail: Text("mohamedaz025"),
                ),
                // لعمل ايكون بجانب نص
                ListTile(
                    title: const Text("Home"),
                    leading: const Icon(Icons.home),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeHotel()));
                    }),
                ListTile(
                    title: const Text("My products"),
                    leading: const Icon(Icons.add_shopping_cart),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Checkout()));
                    }),
                ListTile(
                    title: const Text("About"),
                    leading: const Icon(Icons.help_center),
                    onTap: () {}),
                ListTile(
                    title: const Text("Profile Page"),
                    leading: const Icon(Icons.person),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    }),
                ListTile(
                    title: const Text("Logout"),
                    leading: const Icon(Icons.exit_to_app),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                    }),
                ListTile(
                    title: const Text("AddHotel"),
                    leading: const Icon(Icons.add_card),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            // اسم الصفحه المراد الوصل اليها
                            builder: (context) => AddHotel()),
                      );
                    }),
              ],
            ),
            Container(
              // لعمل مسافة من الاسفل
              margin: const EdgeInsets.only(bottom: 12),
              child: const Text("Developed by mohamed tarek © 2024",
                  style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Home hotel")),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // لعرض جدول من الفير استور كل سطر لوحده
          StreamBuilder<QuerySnapshot>(
              // بهذا الشكل نختار الجدول المراض عرضة
              stream: _firestore.collection('hotel').snapshots(),
              // قيمة بهذال الشكل
              builder: (context, snapshots) {
                // عمل ليست من نوع تيكست

                List<HohelData> hotelwidgetslest = [];
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

          

                  final hotelwidgeteAddToList = HohelData(
                      linkImg1: link_img_1,
                      linkImg2: link_img_2,
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
        ],
      ),
    );
  }
}
