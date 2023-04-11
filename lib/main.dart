import 'package:flutter/material.dart';
import 'package:olympusfood/screens/home_screen.dart';
import 'loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: HomeScreen(),
    );
  }
}
