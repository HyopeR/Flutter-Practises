import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/stores/store_provider/weather_view_model.dart';

class WeatherStateImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _weatherView = Provider.of<WeatherViewModel>(context);
    var theTemp = _weatherView.weather.consolidatedWeather[0].theTemp.floor().toString() + ' °C';
    var weatherStateAbbr = _weatherView.weather.consolidatedWeather[0].weatherStateAbbr;

    return Column(
      children: [

        Text(theTemp, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),

        Image.network(
          'https://www.metaweather.com//static/img/weather/png/$weatherStateAbbr.png',
          width: 200,
          height: 200,
        )

      ],
    );
  }
}
