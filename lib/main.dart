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

      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElements = settings.name.split('/');

        if(pathElements[1] == 'horoscopeDetail') {
          return MaterialPageRoute(builder: (context) => HoroscopeDetail(int.parse(pathElements[2])));
        }

        return null;

      },

      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: HoroscopeList(),
    );
  }

}
