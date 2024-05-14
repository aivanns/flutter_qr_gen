import 'package:flutter/material.dart';

final primary_field = InputDecoration(
  filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black54),
      ),
      hintStyle: TextStyle(color: Colors.black26, fontFamily: "Inter", fontWeight: FontWeight.w500),
      hintText: 'Enter your text here...',
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
          borderRadius: BorderRadius.circular(10)
              ),
);