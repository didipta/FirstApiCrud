
import 'dart:convert';
import 'package:crudass/Model/Product.dart';
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




// Future<void> Productdelete(Function() updateState,String productId,List<Products> products) async {
//
//   String Temperaturesurl='https://crud.teamrabbil.com/api/v1/DeleteProduct/$productId';
//   Uri uri=Uri.parse(Temperaturesurl);
//   Response response =await get(uri);
//   if(response.statusCode==200) {
//     products.where((product) => product.id == productId).toList();
//     updateState();
//   }
//
//
//
// }


