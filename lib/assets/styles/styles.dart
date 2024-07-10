import 'package:flutter/material.dart';

class Styles {

  static const TextStyle buttonText = TextStyle(
    color: Colors.black,
    fontSize: 25,
  );

  static const TextStyle buttonEqualsText = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );

  static final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  static final ButtonStyle buttonEquals = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 42, 152, 32),
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}