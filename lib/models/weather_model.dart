import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final String date;
  final String condition;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String imageUrl;

  WeatherModel({
    required this.date,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.imageUrl,
    required this.cityName,
  });
  factory WeatherModel.fromJson(dynamic data) {
    if (data['error'] != null) {
      return WeatherModel(
        date: 'Can you check the city name again?',
        cityName: 'Error',
        maxTemp: 0,
        minTemp: 0,
        avgTemp: 0,
        condition: '-',
        imageUrl:
            'https://cdn0.iconfinder.com/data/icons/shift-free/32/Error-512.png',
      );
    } else {
      var jsonData = data["forecast"]["forecastday"][0]["day"];
      String date = data["location"]["localtime"];
      return WeatherModel(
        date: 'Updated at: ${date.substring(11)}',
        cityName: data["location"]["name"],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"],
        avgTemp: jsonData["avgtemp_c"],
        condition: jsonData["condition"]["text"],
        imageUrl: 'https:${jsonData["condition"]["icon"]}',
      );
    }
  }

  MaterialColor getThemeColor() {
    if (condition == 'Sunny') {
      return Colors.amber;
    } else if (condition == 'Partly cloudy' ||
        condition == 'Cloudy' ||
        condition == 'Overcast' ||
        condition == 'Mist' ||
        condition == 'Patchy rain possible') {
      return Colors.grey;
    } else {
      return Colors.blue;
    }
  }
}
