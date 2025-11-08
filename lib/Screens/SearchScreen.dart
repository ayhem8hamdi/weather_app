// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';

String reg = 'no data';

class Searchscreen extends StatelessWidget {
  Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 32),
        title: Text(
          'Search a city',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            onChanged: (value) => reg = value,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 26, horizontal: 10),
              labelText: 'Search',
              labelStyle: TextStyle(fontSize: 22, color: Colors.grey),
              hintText: 'Enter City Name',
              hintStyle: TextStyle(fontSize: 24, color: Colors.grey),
              suffixIcon: IconButton(
                onPressed: () {
                  GetWeatherCubit GetWeather =
                      BlocProvider.of<GetWeatherCubit>(context);
                  GetWeather.getWeather(CityName: reg);
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.search,
                  size: 34,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
