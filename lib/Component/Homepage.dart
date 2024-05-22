import 'dart:convert';
import 'package:crudass/Apicall/Apicall.dart';
import 'package:crudass/Component/Productlist.dart';
import 'package:crudass/Model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  List<Products> products=[];
  bool loader=true;

  @override
  void initState(){
    super.initState();
    fetchProducts();


  }

  void fetchProducts() async {
    await getproducts((newProducts, loaders) {
      setState(() {
        products = newProducts;
        loader = loaders;
      });
    });
  }

  void deleteProduct(String id,context) async {
    await Productdelete((newProducts) {
      setState(() {
        products=newProducts;
      });
    },id, products,context);


  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Crud Application",style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.white,
        elevation: 0,
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
      ):Productlist(products: products,handeldelete:deleteProduct) ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}
