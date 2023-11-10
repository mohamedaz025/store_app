// ignore_for_file: non_constant_identifier_names, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/hotel_details.dart';
import 'package:store_app/model/item.dart';
import 'package:store_app/pages/Add_hotel.dart';
import 'package:store_app/pages/Edit_hotel.dart';
import 'package:store_app/pages/Profile%20_page.dart';
import 'package:store_app/pages/checkout.dart';
import 'package:store_app/pages/details_screen.dart';

class HomeHotel extends StatefulWidget {
  const HomeHotel({super.key});

  @override
  State<HomeHotel> createState() => _HomeHotelState();
}

class _HomeHotelState extends State<HomeHotel> {
  // تخذين الفير استور داخل متغير
  final _firestore = FirebaseFirestore.instance;
  // تخذين الاميلات في متغير
  final _auth = FirebaseAuth.instance;
  // متغير من نوع يوزر لتخزين اليوزر المسجل بداخلة
  late User signedinuser;
  String hotel_price = "\$200";
  String? support;

  //  لتشغيل الفونكشون تلقائي
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  // فونكشون استلام البينات من الفير استور تحتاج استدعاء
  void getdata() async {
    // تخذين الفير استور داخل متغير
    final hoteles = await _firestore.collection('hotel').get();
    // عمل طباعة لكل سطر مدخل لوجده وتخذينها داخل متغير
    for (var hotelee in hoteles.docs) {
      print(hotelee.data());
    }
  }

  List<HohelData> hoteldetels = [];

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
                // عمل ليست فارغا ,d[f hk j;,k lk kts k,u hg,d][j hglsjgli]
                List<HohelData> hotelwidgets = [];
                if (!snapshots.hasData) {
                  return const Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ));
                }
                final hohels = snapshots.data!.docs;
                for (var hotel in hohels) {
                  final hotelnames = hotel.get('namehotel');
                  final link_img_1 = hotel.get('link_img_1');
                  final link_img_2 = hotel.get('link_img_2');
                  final locationHotel = hotel.get('locationHotel');
                  final stars = hotel.get('stars');
                  final Datein1 = hotel.get('Datein1');
                  final Dateout1 = hotel.get('Datein1');
                  final price1 = hotel.get('price1');

                  final hotelwidgete = HohelData(
                      link_img1: link_img_1,
                      link_img_2: link_img_2,
                      locationHotel: locationHotel,
                      stars: stars,
                      Datein1: Datein1,
                      Dateout1: Dateout1,
                      price1:price1,
                      hotelname: hotelnames);

                  // اضافو لاعناصر داخل الليست
                  hotelwidgets.add(hotelwidgete);
                }

                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    children: hotelwidgets,
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class HohelData extends StatelessWidget {
  HohelData({
    super.key,
    this.hotelname,
    this.link_img1,
    this.stars,
    this.link_img_2,
    this.locationHotel,
    this.Datein1,
    this.Dateout1,
    this.price1
  });

  final String? hotelname;
  final String? link_img1;
  final String? link_img_2;
  final String? locationHotel;
  final String? stars;
  final String? Datein1 ;
  final String? Dateout1;
  final String? price1;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Hotel_details(
                          hotelname: hotelname.toString(),
                          link_img1: link_img1.toString(),
                          link_img_2: link_img_2.toString(),
                          stars: stars.toString(),
                          Datein1:Datein1.toString(),
                          Dateout1:Dateout1.toString(),
                          price1: price1.toString(),
                          locationHote: locationHotel.toString())));

              print("$locationHotel");
            },
            child: GridTile(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadiusDirectional.only(
                        topEnd: Radius.circular(20),
                        topStart: Radius.circular(20)),
                    child: Image.network(
                      //  لاضافة الصوره من الانترنت
                      "$link_img1",
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      loadingBuilder: //  لعمل تحميل اذا كانت الصورة من الانترنت
                          (context, child, progress) {
                        return progress == null
                            ? child
                            : Container(
                                //   كونتينر لتحديد مكان دائرة التحميل
                                margin:
                                    const EdgeInsets.fromLTRB(50, 50, 50, 50),
                                child: const CircularProgressIndicator());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 0),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$hotelname ',
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.orange,
                      ),
                      Text(
                        '$locationHotel ',
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Editdetails(
                                        hotelname: hotelname.toString(),
                                        link_img1: link_img1.toString(),
                                        link_img_2: link_img_2.toString(),
                                        stars: stars.toString(),
                                        locationHote:
                                            locationHotel.toString())));
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.price_change_outlined),
                        color: Colors.yellow,
                      ),
                      IconButton(
                          onPressed: () {
                            CollectionReference deletehotel =
                                FirebaseFirestore.instance.collection('hotel');
                            deletehotel.doc(hotelname).delete();
                            print(hotelname);
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
