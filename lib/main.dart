// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/methods/ColorFromApi.dart';
import 'package:weather_app/screens/HomeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(NoWeatherState()),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: getcolor(
                        etat: BlocProvider.of<GetWeatherCubit>(context)
                            .etation
                            ?.etat), // Use primary color of the theme
                  )),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: getcolor(
                        etat: BlocProvider.of<GetWeatherCubit>(context)
                            .etation
                            ?.etat), // Use primary color of the theme
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: getcolor(
                        etat: BlocProvider.of<GetWeatherCubit>(context)
                            .etation
                            ?.etat), // Use primary color of the theme
                  ))),
              appBarTheme: AppBarTheme(
                backgroundColor: getcolor(
                    etat: BlocProvider.of<GetWeatherCubit>(context)
                        .etation
                        ?.etat), // Set your custom app bar color here
              ), // Initial color, you can replace 'initial' as per your need
            ),
            home: Homescreen(),
          );
        },
      ),
    );
  }
}


