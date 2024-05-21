

class Products {
  String id;
  String productName;
  String productCode;
  String img;
  String unitPrice;
  String qty;
  String totalPrice;


  Products({
    required this.id,
    required this.productName,
    required this.productCode,
    required this.img,
    required this.unitPrice,
    required this.qty,
    required this.totalPrice,

  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json["_id"],
      productName: json['ProductName'],
      productCode: json['ProductCode'],
      img: json['Img'],
      unitPrice: json['UnitPrice'],
      totalPrice: json['TotalPrice'],
      qty: json['Qty'],


    );
  }

}