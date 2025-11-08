// ignore_for_file: file_names

import 'package:weather_app/models/weather.dart';
import 'package:dio/dio.dart';

class WeatherApi {
  final Dio dio = Dio();
  final String baseurl = 'http://api.weatherapi.com/v1';
  // ignore: non_constant_identifier_names
  final String ApiKey = 'da8f5713b32347568b1231609241307';
  Future<Weather> getweathr({required String region}) async {
    try {
      final response = await dio.get(
          '$baseurl/forecast.json?key=$ApiKey&q=$region&days=1&aqi=no&alerts=no');

      Weather weatherstat = Weather.jsonData(response.data);
      return weatherstat;
    } on DioException catch (e) {
      String errorMessage = e.response?.data['error']['message'] ??
          'there was an error try later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
