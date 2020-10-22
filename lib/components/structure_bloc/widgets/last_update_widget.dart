import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/stores/store_bloc/weather_bloc.dart';

class LastUpdateWidget extends StatefulWidget {
  @override
  _LastUpdateWidgetState createState() => _LastUpdateWidgetState();
}

class _LastUpdateWidgetState extends State<LastUpdateWidget> {

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

        DateTime newDate = (state as WeatherLoadedState).weather.time.toLocal();

        return Text(
            'Son Güncelleme: ${TimeOfDay.fromDateTime(newDate).format(context)}',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)
        );
      },
    );
  }
}
