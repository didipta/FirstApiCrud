import 'package:flutter/material.dart';

void snackbar(BuildContext context,String label)
{
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(label)),
  );
}