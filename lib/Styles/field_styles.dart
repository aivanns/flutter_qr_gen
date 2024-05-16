import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
final primary_field = InputDecoration(
  filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black54),
      ),
      hintStyle: const TextStyle(color: Colors.black26, fontFamily: "Inter", fontWeight: FontWeight.w500),
      hintText: 'Enter your text here...',
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black54),
          borderRadius: BorderRadius.circular(10)
              ),
);