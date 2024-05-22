
import 'package:crudass/Component/Homepage.dart';
import 'package:crudass/Component/Productfrom.dart';
import 'package:crudass/Model/Product.dart';
import 'package:flutter/material.dart';

import 'RouterPath.dart';


MaterialPageRoute? materialPageRoute(RouteSettings settings){
  Widget? widget;
  switch(settings.name){
    case RouterPath.homepath:
      widget = const HomePage();
      break;
    case RouterPath.productfrom:
      Products? product=settings.arguments as Products?;
      print(product);

      widget=ProductFrom(products:product);

      break;

  }
  if(widget !=null){
    return MaterialPageRoute(builder: (context)=>widget!);
  }

  return null;
}