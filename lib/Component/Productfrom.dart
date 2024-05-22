import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductFrom extends StatefulWidget {
  const ProductFrom({Key? key}) : super(key: key);

  @override
  State<ProductFrom> createState() => _ProductFromState();
}

class _ProductFromState extends State<ProductFrom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Product",style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),),
        leading:IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
