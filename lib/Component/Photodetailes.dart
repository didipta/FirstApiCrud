//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Photodetails extends StatefulWidget {
//   final Photos photos;
//   const Photodetails({Key? key, required this.photos}) : super(key: key);
//
//   @override
//   State<Photodetails> createState() => _PhotodetailsState();
// }
//
// class _PhotodetailsState extends State<Photodetails> {
//   @override
//   Widget build(BuildContext context) {
//     var width=MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Photo Details",style: TextStyle(
//             color: Colors.white,
//             fontSize: 18
//         ),),
//         backgroundColor: Colors.blue,
//         elevation: 1,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(10),
//         child:width < 650 ? Column(
//           children: showdetails(widget.photos,width),
//         ):Row(
//           children: showdetails(widget.photos,width),
//         ),
//       ),
//     );
//   }
// }
//
// List<Widget> showdetails (Photos photo,width){
//   return[
//     ClipRRect(
//       borderRadius: BorderRadius.circular(12),
//       child: Image.network(
//         photo.url,
//         fit: BoxFit.fill,
//         height: 400,
//         width:width < 650 ? width:width*0.5,
//
//       ),
//     ),
//     SizedBox(height: 10,width: 10,),
//     // Use Expanded to allow the text to wrap within the available space
//     Expanded(
//       child: Column(
//         children: [
//          // Use Expanded to allow the text to wrap within the available space
//            Text('Title:'+photo.title,
//               softWrap: true,
//               style: TextStyle(fontSize: 16), // Adjust the text style as needed
//             ),
//
//           SizedBox(height: 5,),
//           Center(
//             child: Text('Id:'+photo.id.toString()),
//           )
//         ],
//       ),
//     )
//   ];
// }