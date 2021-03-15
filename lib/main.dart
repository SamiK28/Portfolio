import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Portfolio/app/app.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samarth Khanna',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: PortfolioApp(),
    );
  }
}
