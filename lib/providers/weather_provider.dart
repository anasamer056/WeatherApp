import 'package:flutter/material.dart';
import 'package:weather_app2/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;

  WeatherModel? get weatherData => _weatherData;

  set weatherData(WeatherModel? value) {
    _weatherData = value;
    notifyListeners();
  }
}
