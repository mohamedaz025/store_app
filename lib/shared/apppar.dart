

// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/checkout.dart';
import 'package:store_app/provirder/card.dart';

class ProductsAndPrice extends StatelessWidget {
  const ProductsAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cared>(context);
    return  Row(
              children: [
                Stack(
                  children: [
                    Positioned(
                      bottom: 24,
                      child: Container(
                        child: Text(
                          "${carttt.selectedproducts.length}",
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
                        onPressed: () {
                                 Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Checkout()));
                        }),
                  ],
                ),
//  لعمل ايكونه للضغط عليها

                Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                  ),
                  child: Text(
                    "\$ ${carttt.price}",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            );
  }
}