import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_forecast/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    
    if(event is FetchWeatherEvent) {

      yield WeatherLoadingState();
      
      try {
        // Hava durumu bu alanda getirilecek.
        yield WeatherLoadedState(weather: Weather());

      } catch(err) {
        yield WeatherErrorState();

      }
      
    }
    
  }
}
