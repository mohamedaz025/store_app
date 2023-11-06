// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/model/item.dart';
import 'package:store_app/pages/checkout.dart';
import 'package:store_app/pages/details_screen.dart';
import 'package:store_app/provirder/card.dart';
import 'package:store_app/shared/apppar.dart';
import 'package:store_app/shared/colors.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cared>(context);
    return Scaffold(
      // لعمل قائمة منيو من اليسار
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // لعمل مربع به اسم واميل وصوره خلفيه وصوره شخصيه
                UserAccountsDrawerHeader(
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
                  accountEmail: Text("mohamedaz025@gmail.com"),
                ),
                // لعمل ايكون بجانب نص
                ListTile(
                    title: Text("Home"),
                    leading: Icon(Icons.home),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }),
                ListTile(
                    title: Text("My products"),
                    leading: Icon(Icons.add_shopping_cart),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Checkout()));
                    }),
                ListTile(
                    title: Text("About"),
                    leading: Icon(Icons.help_center),
                    onTap: () {}),
                ListTile(
                    title: Text("Logout"),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () async{await FirebaseAuth.instance.signOut();}),
              ],
            ),
            Container(
              // لعمل مسافة من الاسفل
              margin: EdgeInsets.only(bottom: 12),
              child: Text("Developed by mohamed tarek © 2024",
                  style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("Home"),
        actions: [ProductsAndPrice()],
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // عدد التكرار في كل صف
              crossAxisCount: 1,
              // قياس الطول بالنسبه الي العرض
              childAspectRatio: 3 / 2,
              // المسافة بين كل كونتينر علي محول الطول
              crossAxisSpacing: 20,
              // المسافة بين كل كونتينر علي محور العرض
              mainAxisSpacing: 33),
          // عدد العناصر
          itemCount: item.length,
          // تحتوي علي الودجيت الذي تريد تكراره
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              //  نضع بداخل الديكستشر ديتكتور اي ودجت سنضغط عليها
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Details(prodact: item[index])));
                },
                child: GridTile(
                  // لتحريك الصوره داخل الجريد تايل
                  child: Stack(
                    children: [
                      // لتحريك الصوره داخل الجريد تايل
                      Positioned(
                        right: 0,
                        left: 0,
                        bottom: 0,
                        top: 0,
                        // لعمل حواف للصوره
                        child: ClipRRect(

                            // لعمل حواف للصوره مستديره
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(item[index].imgPath)),
                      ),
                    ],
                  ),

                  footer: GridTileBar(
                    trailing: Container(
                      decoration: BoxDecoration(
                        color:  const Color.fromARGB(255, 255, 192, 192),
                        borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                        color: Colors.green,
                        iconSize: 40,
                        icon: Icon(Icons.add),
                        onPressed: () {
                          carttt.add(item[index]);
                        },
                      ),
                    ),
                    // لاظهار هنصر بداخل ليسه
                    leading: Container(
                      child: Text(
                        "${item[index].price}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 192, 192),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    title: Text(""),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
