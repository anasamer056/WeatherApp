import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/models/weather_model.dart';
import 'package:weather_app2/providers/weather_provider.dart';

class ResultHomePage extends StatelessWidget {
  const ResultHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel? providerWeather =
        Provider.of<WeatherProvider>(context, listen: true).weatherData;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          providerWeather?.getThemeColor() ?? Colors.red,
          providerWeather?.getThemeColor()[100] ?? Colors.red[100]!
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Text(
            providerWeather?.cityName ?? '',
            style: TextStyle(
              fontSize: 55,
            ),
          ), // City Name
          Text(
            providerWeather?.date ?? '',
            style: TextStyle(
              fontSize: 20,
            ),
          ), // Time
          Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${providerWeather?.avgTemp} °C',
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ), // Avg Temp
            ],
          ),
          Text(
            'Max: ${providerWeather?.maxTemp} °C | Min: ${providerWeather?.minTemp} °C',
            style: TextStyle(
              fontSize: 20,
            ),
          ), // Max Temp

          Spacer(
            flex: 1,
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(
              providerWeather?.imageUrl ?? '',
              scale: 0.4,
            ),
          ),
          Text(
            providerWeather?.condition ?? '',
            style: TextStyle(
              fontSize: 30,
            ),
          ),

          Spacer(
            flex: 5,
          ), // Condition
        ],
      ),
    );
  }
}
