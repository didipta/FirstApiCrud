import 'package:flutter/material.dart';

ButtonStyle buttonStyle(colors) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(colors), // Background color
    foregroundColor: MaterialStateProperty.all(Colors.white), // Text color
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Button border radius
      ),
    ),

    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16, vertical: 10)), // Button padding
  );
}