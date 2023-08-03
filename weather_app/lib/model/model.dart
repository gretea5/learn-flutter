import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Model {
  Widget getAQIDescription(int aqiNumber) {
    if (aqiNumber == 1) {
      return const Text(
        '"매우좋음"',
        style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
      );
    } else if (aqiNumber == 2) {
      return const Text(
        '"좋음"',
        style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
      );
    } else if (aqiNumber == 3) {
      return const Text(
        '"보통"',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      );
    } else if (aqiNumber == 4) {
      return const Text(
        '"나쁨"',
        style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
      );
    } else if (aqiNumber == 5) {
      return const Text(
        '"매우나쁨"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return const Text(
        '"잘못된 값 입력"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  Widget getAQIWidget(int aqiNumber) {
    switch (aqiNumber) {
      case 1:
        return Image.asset(
          'image/good.png',
          width: 37,
          height: 35,
        );
      case 2:
        return Image.asset(
          'image/fair.png',
          width: 37,
          height: 35,
        );
      case 3:
        return Image.asset(
          'image/moderate.png',
          width: 37,
          height: 35,
        );
      case 4:
        return Image.asset(
          'image/poor.png',
          width: 37,
          height: 35,
        );
      case 5:
        return Image.asset(
          'image/bad.png',
          width: 37,
          height: 35,
        );
      default:
        return Image.asset(
          'image/unknown.png',
          width: 37,
          height: 35,
          color: Colors.white,
        );
    }
  }

  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/climacon-colud_lightning.svg',
        color: Colors.black87,
      );
    } else if (condition < 500) {
      return SvgPicture.asset(
        'svg/climacon-cloud_rain.svg',
        color: Colors.black87,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_snow_alt.svg',
        color: Colors.black87,
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
        color: Colors.black87,
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        color: Colors.black87,
      );
    } else {
      return SvgPicture.asset(
        'svg/unknown.svg',
        color: Colors.black87,
      );
    }
  }
}
