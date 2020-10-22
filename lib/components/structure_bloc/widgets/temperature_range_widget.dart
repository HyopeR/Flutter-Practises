import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/stores/store_bloc/weather_bloc.dart';

class TemperatureRangeWidget extends StatefulWidget {
  @override
  _TemperatureRangeWidgetState createState() => _TemperatureRangeWidgetState();
}

class _TemperatureRangeWidgetState extends State<TemperatureRangeWidget> {

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

        var maxTemperature = (state as WeatherLoadedState).weather.consolidatedWeather[0].maxTemp.floor().toString() + ' °C';
        var minTemperature = (state as WeatherLoadedState).weather.consolidatedWeather[0].minTemp.floor().toString() + ' °C';

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Text('Maksimum: $maxTemperature', style: TextStyle(fontSize: 18)),
            Text('Minumum: $minTemperature',  style: TextStyle(fontSize: 18)),

          ],
        );
      },
    );
  }
}
