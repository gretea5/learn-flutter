import 'package:flutter/material.dart';
import 'package:webtoon_app/screens/home_screen.dart';
import 'package:webtoon_app/services/api_service.dart';

void main() {
  var apiservice = APiService();
  apiservice.getTodaysToons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
