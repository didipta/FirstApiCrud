

import 'package:crudass/Utils/validurl.dart';

class Products {
  String id;
  String productName;
  String productCode;
  String img;
  double unitPrice;
  int qty;
  double totalPrice;

  static const String defaultImageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLE0JqFsUvB2IWOrtSAb3k1YtLMisNsehxZ_eYVN5zmg&s';


  Products({
    required this.id,
    required this.productName,
    required this.productCode,
    required this.img,
    required this.unitPrice,
    required this.qty,
    required this.totalPrice,

  });

  factory Products.fromJson(Map<String, dynamic> json)  {
    String imageUrl = json['Img'] ?? '';
    if (!isValidUrl(imageUrl)) {
      imageUrl = defaultImageUrl;
    }
    int quantity;
    if (json['Qty'] is int) {
      quantity = json['Qty'];
    } else if (json['Qty'] is String) {
      quantity = int.tryParse(json['Qty']) ?? 0;
    } else {
      quantity = 0;
    }
    return Products(
      id: json["_id"]??"",
      productName: json['ProductName']??"",
      productCode: json['ProductCode']??"",
      img: imageUrl,
      unitPrice: json['UnitPrice'] is double?json['UnitPrice']:double.tryParse(json['UnitPrice'].toString())??0.0,
      totalPrice: json['TotalPrice'] is double
    ? json['TotalPrice']
        : double.tryParse(json['TotalPrice'].toString()) ?? 0.0,
      qty: quantity,
    );
  }

}