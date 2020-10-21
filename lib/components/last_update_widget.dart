import 'package:flutter/material.dart';

class LastUpdateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
        'Son Güncelleme: ${TimeOfDay(hour: 20, minute: 35).format(context)}',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)
    );
  }
}
