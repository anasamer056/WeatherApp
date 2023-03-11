import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/providers/weather_provider.dart';
import 'package:weather_app2/screens/homepage/homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Provider.of<WeatherProvider>(context)
                  .weatherData
                  ?.getThemeColor() ??
              Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
