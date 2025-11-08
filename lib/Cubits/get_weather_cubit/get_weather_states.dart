import 'package:weather_app/models/weather.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weather weathermodal;

  WeatherLoadedState({required this.weathermodal});
}

class WeatherFailedState extends WeatherState {
  final String error;

  WeatherFailedState({required this.error});
}
