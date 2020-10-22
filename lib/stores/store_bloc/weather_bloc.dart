import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_forecast/locator.dart';
import 'package:weather_forecast/models/weather.dart';
import 'package:weather_forecast/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherRepository weatherRepo = locator.get()<WeatherRepository>();
  // WeatherRepository weatherRepo = locator<WeatherRepository>();

  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    
    if(event is FetchWeatherEvent) {

      yield WeatherLoadingState();
      
      try {
        final Weather getWeather = await weatherRepo.getWeather(event.cityName);

        yield WeatherLoadedState(weather: getWeather);

      } catch(err) {
        yield WeatherErrorState();

      }
      
    }
    
  }
}
