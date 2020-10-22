part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadedState extends WeatherState {
  final Weather weather;
  WeatherLoadedState({@required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherErrorState extends WeatherState {
  @override
  List<Object> get props => [];
}
