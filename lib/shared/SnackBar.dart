import 'package:flutter/material.dart';
// اشعار الخطاء اسفل الشاشه
showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    duration: Duration(days: 1),
    content: Text(text),
    action: SnackBarAction(label: "close", onPressed: () {}),
  ));
}
