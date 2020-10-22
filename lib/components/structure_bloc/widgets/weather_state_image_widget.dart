import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/stores/store_bloc/weather_bloc.dart';

class WeatherStateImageWidget extends StatefulWidget {
  @override
  _WeatherStateImageWidgetState createState() => _WeatherStateImageWidgetState();
}

class _WeatherStateImageWidgetState extends State<WeatherStateImageWidget> {

  WeatherBloc _weatherBloc;

  @override
  void initState() {
    super.initState();
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        cubit: _weatherBloc,
        builder: (context, WeatherState state) {

          var theTemp = (state as WeatherLoadedState).weather.consolidatedWeather[0].theTemp.floor().toString() + ' °C';
          var weatherStateAbbr = (state as WeatherLoadedState).weather.consolidatedWeather[0].weatherStateAbbr;

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
    );
  }
}
