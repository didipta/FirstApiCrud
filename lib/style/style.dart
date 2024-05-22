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

BoxDecoration boxDecoration(){
  return BoxDecoration(
    color: null,
    borderRadius: BorderRadius.circular(12.0),
    // boxShadow: [
    //   BoxShadow(
    //     color: Colors.black26,
    //     blurRadius: 1.0,
    //     spreadRadius: 1.0,
    //     offset: Offset(0, 0),
    //   ),
    // ],
  );
}