part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChangeEvent extends ThemeEvent {

  final String weatherStateAbbr;
  ThemeChangeEvent({@required this.weatherStateAbbr});

  @override
  List<Object> get props => [weatherStateAbbr];

}
