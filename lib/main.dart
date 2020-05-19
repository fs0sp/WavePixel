import 'package:flutter/material.dart';
import 'datasource.dart';
import 'views/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wave Pixel',
      theme: ThemeData(
        primaryColor: primaryBlack,
      ),      
      home: HomePage(),
    );
  }
}