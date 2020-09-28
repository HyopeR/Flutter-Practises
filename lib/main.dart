import 'package:flutter/material.dart';
import './components/horoscope_detail.dart';
import './components/horoscope_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Horoscope Guide',

      initialRoute: '/',

      routes: {
        '/': (context) => HoroscopeList(),
        '/horoscopeList': (context) => HoroscopeList(),
      },

      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: HoroscopeList(),
    );
  }

}
