import 'package:flutter/material.dart';

const decorationtextfiled = InputDecoration(
  
  hintText: "Enter Your email :",
  // To delete borders
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
  // fillColor: Colors.red,
  filled: true,
  contentPadding: EdgeInsets.all(8),
);
