import 'package:flutter/material.dart';

class TemperatureRangeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Text('Maksimum: ${24} °C', style: TextStyle(fontSize: 18)),
        Text('Minumum: ${12} °C',  style: TextStyle(fontSize: 18)),

      ],
    );
  }
}
