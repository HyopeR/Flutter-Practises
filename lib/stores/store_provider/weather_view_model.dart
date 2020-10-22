import 'package:flutter/material.dart';
import 'package:weather_forecast/data/weather_repository.dart';
import 'package:weather_forecast/locator.dart';
import 'package:weather_forecast/models/weather.dart';

enum WeatherState { WeatherInitialState, WeatherLoadingState, WeatherLoadedState, WeatherErrorState }

class WeatherViewModel with ChangeNotifier {

  WeatherRepository weatherRepo = locator<WeatherRepository>();
  Weather weather;
  WeatherState _state;

  WeatherViewModel() {
    weather = Weather();
    _state = WeatherState.WeatherInitialState;
  }

  WeatherState get state => _state;

  set state(WeatherState value) {
    _state = value;
    notifyListeners();
  }

  Future<Weather> getWeather(String cityName) async {

    try{
      state = WeatherState.WeatherLoadingState;
      weather = await weatherRepo.getWeather(cityName);
      state = WeatherState.WeatherLoadedState;
    }catch(err) {
      state = WeatherState.WeatherErrorState;

    }

    return weather;
  }

}