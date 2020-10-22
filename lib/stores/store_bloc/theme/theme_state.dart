part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {

  final ThemeData theme;
  final MaterialColor color;

  ThemeInitial({@required this.theme, @required this.color});

  @override
  List<Object> get props => [theme, color];
}
