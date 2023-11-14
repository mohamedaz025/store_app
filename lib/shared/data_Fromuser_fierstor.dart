// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetdataFromfierstor extends StatefulWidget {
  final String documentId;

  const GetdataFromfierstor({Key? key, required this.documentId})
      : super(key: key);

  @override
  State<GetdataFromfierstor> createState() => _GetdataFromfierstorState();
}

final dialogusernameController = TextEditingController();
final credential = FirebaseAuth.instance.currentUser;
CollectionReference users = FirebaseFirestore.instance.collection('uesers');

class _GetdataFromfierstorState extends State<GetdataFromfierstor> {
  mydilog(Map data, dynamic mykey) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Container(
            padding: const EdgeInsets.all(22),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    controller: dialogusernameController,
                    maxLength: 20,
                    decoration: InputDecoration(hintText: "${data[mykey]}")),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          users
                              .doc(credential!.uid)
                              .update({mykey: dialogusernameController.text});
                          setState(() {
                            Navigator.pop(context);
                            dialogusernameController.clear();
                          });
                        },
                        child: const Text(
                          "Edit",
                          style: TextStyle(fontSize: 22),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(fontSize: 22),
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // اسم الجدول مخذن في متغير
    CollectionReference users = FirebaseFirestore.instance.collection('uesers');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "username: ${data['username']} ",
                    style: const TextStyle(fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        mydilog(data, 'username');
                      },
                      icon: const Icon(Icons.edit))
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "age: ${data['age']} ",
                    style: const TextStyle(fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        mydilog(data, 'age');
                      },
                      icon: const Icon(Icons.edit))
                ],
              ),
              const SizedBox(height: 15),
              Text(
                "Email: ${data['email']}",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          );
        }

        return const Text("loading");
      },
    );
  }
}
