import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  final parseWeatherData;
  const WeatherScreen({super.key, this.parseWeatherData});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp;
  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double temp2 = weatherData["main"]["temp"];
    temp = temp2.round();
    print(temp);

    cityName = weatherData['name'];
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cityName,
                style: const TextStyle(
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                '$temp°C',
                style: const TextStyle(
                  fontSize: 30.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
