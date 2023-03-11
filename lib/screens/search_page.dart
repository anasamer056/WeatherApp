import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/models/weather_model.dart';
import 'package:weather_app2/providers/weather_provider.dart';
import 'package:weather_app2/services/weather_service.dart';

WeatherModel? weatherData2;

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search by city name'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search_rounded),
                  color: Colors.black,
                  onPressed: () async {
                    WeatherService service = WeatherService();
                    WeatherModel weatherData =
                        await service.getWeather(cityName!);
                    Navigator.pop(context);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weatherData;
                  },
                ),
                hintText: 'Type the city name',
                label: Text('Search')),
            onSubmitted: (text) async {
              if (text == '' || text == null) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.red[400],
                      title: Text('Error'),
                    ),
                    body: Center(
                        child: Text(
                      'Invalid Input',
                      style: TextStyle(fontSize: 40),
                    )),
                  );
                }));
              } else {
                cityName = text;
                WeatherService service = WeatherService();
                WeatherModel weatherData = await service.getWeather(cityName!);
                Navigator.pop(context);
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weatherData;
              }
            },
            onChanged: (data) => cityName = data,
          ),
        ),
      ),
    );
  }
}
