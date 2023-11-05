// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/provirder/card.dart';
import 'package:store_app/shared/apppar.dart';
import 'package:store_app/shared/colors.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cared>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbarGreen,
          title: Text(""),
          actions: [ProductsAndPrice()],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 550,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: carttt.selectedproducts.length,
                  // itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        subtitle: Text(
                            "${carttt.selectedproducts[index].price} - ${carttt.selectedproducts[index].location}"),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              carttt.selectedproducts[index].imgPath),
                        ),
                        title: Text("${carttt.selectedproducts[index].name} "),
                        trailing: IconButton(
                            onPressed: () {
                              carttt.delete(carttt.selectedproducts[index]);
                            },
                            icon: Icon(Icons.remove)),
                      ),
                    );
                  }),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(BTNpink),
                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
              ),
              child: Text(
                "Pay ${carttt.price}",
                style: TextStyle(fontSize: 19),
              ),
            ),
          ],
        ));
  }
}
