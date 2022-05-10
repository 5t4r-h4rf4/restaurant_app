import 'package:flutter/material.dart';
import 'package:restaurant_app/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      home: MainScreen(),
    );
  }
}
