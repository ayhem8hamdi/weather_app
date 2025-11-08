// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Failedweatherwidget extends StatelessWidget {
  const Failedweatherwidget({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            error,
            softWrap: true,
            style: const TextStyle(fontSize: 22, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
