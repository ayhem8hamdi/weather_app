// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Noweatherscreen extends StatelessWidget {
  const Noweatherscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There is no weather start',
            style: TextStyle(fontSize: 31, color: Colors.grey),
          ),
          Text('searching Now ...',
              style: TextStyle(fontSize: 31, color: Colors.grey)),
        ],
      ),
    );
  }
}
