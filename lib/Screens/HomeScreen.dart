// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/Screens/SearchScreen.dart';
import 'package:weather_app/Widgets/EtatWeatherScreen.dart';
import 'package:weather_app/Widgets/FailedWeatherWidget.dart';
import 'package:weather_app/Widgets/NoWeatherScreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Weather App',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Searchscreen();
                }));
              },
              icon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.search,
                  size: 40,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
        if (state is NoWeatherState) {
          return const Noweatherscreen();
        } else if (state is WeatherLoadedState) {
          return Etatweatherscreen(info: state.weathermodal);
        } else if (state is WeatherFailedState) {
          return Failedweatherwidget(error: state.error);
        } else {
          return Text('data');
        }
      }),
    );
  }
}
