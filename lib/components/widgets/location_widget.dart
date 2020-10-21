import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {

  final String selectedCity;
  LocationWidget({@required this.selectedCity});

  @override
  Widget build(BuildContext context) {
    return Text('Bilecik', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24));
  }
}
