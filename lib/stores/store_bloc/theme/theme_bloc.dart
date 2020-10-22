import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(theme: ThemeData.light(), color: Colors.blue));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {

    ThemeInitial themeInitial;

    if(event is ThemeChangeEvent) {

      switch(event.weatherStateAbbr) {

        // karlı, sulu karlı, dolu, fırtına, çok bulutlu
        case 'sn':
        case 'sl':
        case 'h':
        case 't':
        case 'hc':
          themeInitial = ThemeInitial(theme: ThemeData(primarySwatch: Colors.blueGrey), color: Colors.blueGrey);
          break;

        // ağır yamurlu, hafif yağmurlu, sağanak yağışlı
        case 'hr':
        case 'lr':
        case 's':
          themeInitial = ThemeInitial(theme: ThemeData(primarySwatch: Colors.indigo), color: Colors.indigo);
          break;

      // az blulutlu, güneşli
        case 'lc':
        case 'c':
          themeInitial = ThemeInitial(theme: ThemeData(primarySwatch: Colors.orange), color: Colors.orange);
          break;
      }

      yield themeInitial;
    }

  }
}
