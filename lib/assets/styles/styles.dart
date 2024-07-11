import 'package:flutter/material.dart';

class Styles {

  static const TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontFamily: "Seven",
  );

  static const TextStyle ledNumber = TextStyle(
    color: Color.fromARGB(255, 93, 90, 90),
    fontSize: 48,
    fontFamily: "Seven",
  );

  static final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 43, 45, 43),
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  static final ButtonStyle buttonEquals = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 64, 208, 51),
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}