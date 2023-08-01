import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (e) {
      print("There was a problem getting your location");
    }
  }

  void fetchData() async {
    http.Response response = await http.get(Uri.parse(
        "https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1"));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var myJson = jsonDecode(jsonData);
      print(myJson["weather"][0]["description"]);
      print(myJson["wind"]["speed"]);
      print(myJson["id"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          child: Text("Get my Location"),
        ),
      ),
    );
  }
}
