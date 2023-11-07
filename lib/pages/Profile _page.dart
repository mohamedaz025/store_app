import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/shared/colors.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text("Profile Page"),
        actions: [
          TextButton.icon(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (!mounted) return;
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: const Text(
                "logout",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Container(
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 131, 177, 255),
                  borderRadius: BorderRadius.circular(11)),
              child: const Text(
                "Info from firebase Auth",
                style: TextStyle(fontSize: 25),
              ),
            )),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text(
                  "Email:",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 11),
                Text(
                  "Created data:",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 11),
                Text(
                  "Last log in:",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            const SizedBox(height: 60),
            Center(
              child: Container(
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 131, 177, 255),
                    borderRadius: BorderRadius.circular(11)),
                child: const Text(
                  "Info from firebase Firestore",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
