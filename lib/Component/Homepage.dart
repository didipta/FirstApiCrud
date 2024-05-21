import 'dart:convert';

import 'package:crudass/Component/Productlist.dart';
import 'package:crudass/Model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  bool loader=true;
  List<Products> products=[];
  Future<void> _getproducts() async{
    setState(() {
    });
    products=[];
    loader=true;
    const String Temperaturesurl="https://crud.teamrabbil.com/api/v1/ReadProduct";
    Uri uri=Uri.parse(Temperaturesurl);
    Response response =await get(uri);
    if(response.statusCode==200){
      Map<String,dynamic> jsonList = jsonDecode(response.body);
      List<dynamic> data=jsonList['data'];
      products=data.map((json) => Products.fromJson(json)).toList();
    }
    else{

    }

    loader=false;
    setState(() {

    });
  }
  @override
  void initState(){
    super.initState();
    _getproducts();

    setState((){});


  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Gallery App",style: TextStyle(
          color: Colors.white,
          fontSize: 18
        ),),
        backgroundColor: Colors.blue,
        elevation: 1,
      ),
      body: Visibility(
        visible: loader==false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child:products.length==0?
        Container(

         child: Text("No Product Fround",style: TextStyle(
           fontSize: 16,
           color: Colors.red,
           fontWeight: FontWeight.bold
         ),),
      ):Productlist(products: products) ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}
