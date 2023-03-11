import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/models/weather_model.dart';
import 'package:weather_app2/providers/weather_provider.dart';
import 'package:weather_app2/screens/homepage/blank_homepage.dart';
import 'package:weather_app2/screens/homepage/result_homepage.dart';
import 'package:weather_app2/screens/search_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    WeatherModel? providerWeather =
        Provider.of<WeatherProvider>(context, listen: true).weatherData;

    return Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
          actions: [
            IconButton(
              icon: Icon(Icons.search_rounded),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
            ),
          ],
        ),
        body: providerWeather == null ? BlankHomePage() : ResultHomePage());
  }
}
