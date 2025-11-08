import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weatherAPI.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit(super.NoWeatherState);
  Weather? etation;
  getWeather({required String CityName}) async {
    try {
      Weather weath = await WeatherApi().getweathr(region: CityName);
      etation = weath;
      emit(WeatherLoadedState(weathermodal: weath));
    } catch (e) {
      emit(WeatherFailedState(error: e.toString()));
    }
  }
}
