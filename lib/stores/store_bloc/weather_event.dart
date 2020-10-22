part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent {

  final String cityName;
  FetchWeatherEvent({@required this.cityName});

  @override
  List<Object> get props => [cityName];

}


class RefreshWeatherEvent extends WeatherEvent {

  final String cityName;
  RefreshWeatherEvent({@required this.cityName});

  @override
  List<Object> get props => [cityName];

}
