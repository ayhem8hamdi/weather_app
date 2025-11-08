// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/methods/ColorFromApi.dart';
import 'package:weather_app/methods/SubstringFromString.dart';
import 'package:weather_app/models/weather.dart';

class Etatweatherscreen extends StatelessWidget {
  const Etatweatherscreen({super.key, required this.info});
  final Weather info;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            getcolor(
                    etat:
                        BlocProvider.of<GetWeatherCubit>(context).etation?.etat)
                .shade300,
            Colors.white
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    info.location,
                    style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                  ),
                  Text('Updated at ${substringFromFirstSpace(info.date)}',
                      style: TextStyle(fontSize: 18))
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Image(
                        image: (info.etat).toLowerCase().contains('sunny')
                            ? AssetImage('assets/images/clear.png')
                            : (info.etat).toLowerCase().contains('cloudy')
                                ? AssetImage('assets/images/cloudy.png')
                                : (info.etat).toLowerCase().contains('rain')
                                    ? AssetImage('assets/images/rainy.png')
                                    : (info.etat).toLowerCase().contains('snow')
                                        ? AssetImage('assets/images/snow.png')
                                        : AssetImage(
                                            'assets/images/thunderstorm.png')),
                    Spacer(flex: 1),
                    Text('${info.temp}',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold)),
                    Spacer(flex: 1),
                    Column(
                      children: [
                        Text('max: ${info.maxTemp.round()}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('min: ${info.minTemp.round()}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ),
              Text(info.etat,
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold))
            ],
          ),
        );
      },
    );
  }
}
