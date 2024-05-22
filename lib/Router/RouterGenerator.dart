
import 'package:crudass/Component/Homepage.dart';
import 'package:crudass/Component/Productfrom.dart';
import 'package:flutter/material.dart';

import 'RouterPath.dart';


MaterialPageRoute? materialPageRoute(RouteSettings settings){
  Widget? widget;
  switch(settings.name){
    case RouterPath.homepath:
      widget = const HomePage();
      break;
    case RouterPath.productfrom:
      widget=ProductFrom();
      break;

  }
  if(widget !=null){
    return MaterialPageRoute(builder: (context)=>widget!);
  }

  return null;
}