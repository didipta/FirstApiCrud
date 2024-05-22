
import 'package:crudass/Model/Product.dart';
import 'package:crudass/Router/RouterPath.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class Productlist extends StatelessWidget{
  final List<Products> products;
  final handeldelete ;
  const Productlist({Key? key, required this.products, this.handeldelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return ResponsiveGridList(
        verticalGridSpacing: 8,
        horizontalGridSpacing: 8,
        horizontalGridMargin: 20,
        verticalGridMargin: 20,
        minItemsPerRow: width> 650? 2:1 ,
        minItemWidth: width> 650? width : width*0.5,
        children: List.generate(
            products.length,
                (index) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(

                    onTap: (){
                      Navigator.pushNamed(context, RouterPath.detailpage,arguments:products[index] );
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                        boxShadow:[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 2),
                          )
                        ]
                      ),
               padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              products[index].img,
                              fit: BoxFit.fill,
                              height: 80,
                              width: 80,

                            ),
                          ),
                          SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment:CrossAxisAlignment.start ,
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [
                              Text(
                                  products[index].productName,
                                  softWrap: true,
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                   maxLines: 1,
                                overflow:TextOverflow.ellipsis,// Adjust the text style as needed
                                ),
                              SizedBox(height: 5,),
                              Text(
                                  products[index].productCode,
                                style: TextStyle(fontSize: 10,color: Colors.grey), // Adjust the text style as needed
                                ),
                              SizedBox(height: 10,),
                              Text("Tk "+
                                products[index].unitPrice.toString(),
                                style: TextStyle(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.bold), // Adjust the text style as needed
                              ),

                            ],
                          ),



                        ],
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.edit,size: 18,color: Colors.grey,)),
                      IconButton(onPressed: (){
                        handeldelete(products[index].id,context);
                      }, icon: const Icon(Icons.delete_outline_sharp,size: 18,color: Colors.red,)),

                    ],
                  )
                ],
              ),
            ),
                  ),
                )
        ),



    );
  }
}
