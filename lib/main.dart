import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sample_test/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_test',
      theme: ThemeData(primaryColor: Colors.white),
      home: MyHomePage(title: 'Flutter Test'),
      debugShowCheckedModeBanner: false,
    );
  }
}
