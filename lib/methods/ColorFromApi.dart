import 'package:flutter/material.dart';
MaterialColor getcolor({required String? etat}) {
  if (etat == null) {
    return Colors.blue;
  }
  if (etat.toLowerCase().contains('sunny')) {
    return Colors.amber;
  } else if (etat.toLowerCase().contains('rain')) {
    return Colors.blueGrey;
  } else if (etat.toLowerCase().contains('cloudy')) {
    return Colors.grey;
  } else {
    return Colors.blue; // Default color if no condition matches
  }
}