
import 'dart:convert';
import 'package:crudass/Model/Product.dart';
import 'package:crudass/Utils/DailogBox.dart';
import 'package:crudass/Utils/SnackBar.dart';
import 'package:crudass/style/style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> getproducts(Function(List<Products>, bool) updateState) async{
  List<Products> products = [];
  bool loader = true;
  updateState(products, loader);
  const String url="https://crud.teamrabbil.com/api/v1/ReadProduct";
  Uri uri=Uri.parse(url);
  Response response =await get(uri);
  if(response.statusCode==200){
    Map<String,dynamic> jsonList = jsonDecode(response.body);
    List<dynamic> data=jsonList['data'];
    try {
      products = data.map((json) => Products.fromJson(json)).toList();
    } catch (e) {
      // Handle any errors that occur during the mapping process
      print('Error during JSON to Product mapping: $e');
    }

  }
  else{

  }
  loader=false;
  updateState(products, loader);

}




Future<void> Productdelete(Function(List<Products>) updateState,String productId,List<Products> products,context) async {

  dialogBox(() async {
  String Temperaturesurl='https://crud.teamrabbil.com/api/v1/DeleteProduct/$productId';
  Uri uri=Uri.parse(Temperaturesurl);
  Response response =await get(uri);
  if (response.statusCode == 200) {
  List<Products> newproducts= products.where((product) => product.id != productId).toList();
  updateState(newproducts);
   snackbar(context, 'Product deleted successfully');
  Navigator.of(context).pop();
  } else {
    snackbar(context, 'Failed to delete the product');

  }
  }, context,"Alert Box",'Are you sure you want to delete this item?');
}


