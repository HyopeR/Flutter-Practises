import 'package:flutter/material.dart';
import 'package:weather_forecast/data/weather_repository.dart';
import 'package:weather_forecast/locator.dart';
import 'package:weather_forecast/models/weather.dart';

enum WeatherState { WeatherInitialState, WeatherLoadingState, WeatherLoadedState, WeatherErrorState }

class WeatherViewModel with ChangeNotifier {

  WeatherRepository _weatherRepo = locator<WeatherRepository>();
  Weather _weather;
  WeatherState _state;

  WeatherViewModel() {
    _weather = Weather();
    _state = WeatherState.WeatherInitialState;
  }

  WeatherState get state => _state;
  Weather get weather => _weather;

  set state(WeatherState value) {
    _state = value;
    notifyListeners();
  }

  Future<Weather> getWeather({@required String cityName}) async {

    try{
      state = WeatherState.WeatherLoadingState;
      _weather = await _weatherRepo.getWeather(cityName);
      state = WeatherState.WeatherLoadedState;
    }catch(err) {
      state = WeatherState.WeatherErrorState;

    }

    return _weather;
  }


  Future<Weather> refreshWeather({@required String cityName}) async {

    try{
      _weather = await _weatherRepo.getWeather(cityName);
      state = WeatherState.WeatherLoadedState;
    }catch(err) {

    }

    return _weather;
  }

}