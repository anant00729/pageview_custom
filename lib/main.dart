import 'package:flutter/material.dart';
import 'package:flutter_page_view_slider/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Base App',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}


