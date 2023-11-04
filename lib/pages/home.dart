// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:store_app/model/item.dart';
import 'package:store_app/shared/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                    onTap: () {}),
                ListTile(
                    title: Text("My products"),
                    leading: Icon(Icons.add_shopping_cart),
                    onTap: () {}),
                ListTile(
                    title: Text("About"),
                    leading: Icon(Icons.help_center),
                    onTap: () {}),
                ListTile(
                    title: Text("Logout"),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () {}),
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
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // عدد التكرار في كل صف
              crossAxisCount: 2,
              // قياس الطول بالنسبه الي العرض
              childAspectRatio: 3 / 3,
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
                onTap: () {},
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
                    trailing: IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.add),
                      onPressed: () {},
                    ),
                    leading: Text("\$12.99"),
                    title: Text(""),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
