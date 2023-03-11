import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app2/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeather(String cityName) async {
    Uri url = Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=acf11d26cf6543efb85195259231402&q=$cityName&days=10');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weatherData = WeatherModel.fromJson(data);
    return weatherData;
  }
}
