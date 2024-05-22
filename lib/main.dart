
import 'package:crudass/Router/RouterGenerator.dart';
import 'package:crudass/Router/RouterPath.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Crud Ass',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,

        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(

          bodyMedium: GoogleFonts.poppins(textStyle: textTheme.bodyMedium),
        ),



      ),
      initialRoute: RouterPath.initialRoute,
      onGenerateRoute:materialPageRoute,
    );
  }
}



