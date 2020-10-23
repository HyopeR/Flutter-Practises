import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/stores/store_provider/weather_view_model.dart';

class LastUpdateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _weatherView = Provider.of<WeatherViewModel>(context);
    DateTime newDate = _weatherView.weather.time.toLocal();
    
    return Text(
        'Son Güncelleme: ${TimeOfDay.fromDateTime(newDate).format(context)}',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)
    );
  }
}
