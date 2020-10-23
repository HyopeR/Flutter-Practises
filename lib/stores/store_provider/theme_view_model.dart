import 'package:flutter/material.dart';

enum ThemeState { ThemeInitial }

class ThemeViewModel with ChangeNotifier {

  ThemeViewModel _themeModel;

  ThemeData _theme;
  MaterialColor _color;

  ThemeData get theme => _theme;

  set theme(ThemeData value) {
    _theme = value;
  }

  MaterialColor get color => _color;

  set color(MaterialColor value) {
    _color = value;
  }

  ThemeViewModel get themeModel => _themeModel;

  set themeModel(ThemeViewModel value) {
    _themeModel = value;
    notifyListeners();
  }

  ThemeViewModel() {
    this._theme = ThemeData();
    this._color = Colors.blue;
    this._themeModel = ThemeViewModel.initial(_theme, _color);
  }
  ThemeViewModel.initial(this._theme, this._color);


  void changeTheme({@required String weatherStateAbbr}) async {
    ThemeViewModel temporaryView;

    switch(weatherStateAbbr) {

    // karlı, sulu karlı, dolu, fırtına, çok bulutlu
      case 'sn':
      case 'sl':
      case 'h':
      case 't':
      case 'hc':
        temporaryView = ThemeViewModel.initial(ThemeData(primarySwatch: Colors.blueGrey), Colors.blueGrey);
        break;

    // ağır yamurlu, hafif yağmurlu, sağanak yağışlı
      case 'hr':
      case 'lr':
      case 's':
        temporaryView = ThemeViewModel.initial(ThemeData(primarySwatch: Colors.indigo), Colors.indigo);
        break;

    // az blulutlu, güneşli
      case 'lc':
      case 'c':
        temporaryView = ThemeViewModel.initial(ThemeData(primarySwatch: Colors.orange), Colors.orange);
        break;
    }

    themeModel = temporaryView;
  }
}