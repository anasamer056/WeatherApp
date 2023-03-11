import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app2/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app2/models/weather_model.dart';
import 'package:weather_app2/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoadingState());

  WeatherService service = WeatherService();
  WeatherModel? weatherData;

  void getWeatherCubit({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherData = await service.getWeather(cityName);
      emit(WeatherFetchedState());
    } catch (e) {
      emit(WeatherNotFetchedState());
    }
  }
}
