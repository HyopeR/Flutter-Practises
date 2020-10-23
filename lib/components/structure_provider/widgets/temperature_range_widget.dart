import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/stores/store_provider/weather_view_model.dart';

class TemperatureRangeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherView = Provider.of<WeatherViewModel>(context);
    var maxTemperature = _weatherView.weather.consolidatedWeather[0].maxTemp.floor().toString() + ' °C';
    var minTemperature = _weatherView.weather.consolidatedWeather[0].minTemp.floor().toString() + ' °C';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Text('Maksimum: $maxTemperature', style: TextStyle(fontSize: 18)),
        Text('Minumum: $minTemperature',  style: TextStyle(fontSize: 18)),

      ],
    );
  }
}
