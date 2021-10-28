import 'package:flutter/material.dart';
import 'package:game_mini/ui/pages/home.dart';
import '';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     title: '',
     home: HomePage(),
    );
  }
}

