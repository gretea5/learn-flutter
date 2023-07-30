import 'package:flutter/material.dart';
import 'package:responsive_lec/mypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ))),
      home: const MyPage(),
    );
  }
}