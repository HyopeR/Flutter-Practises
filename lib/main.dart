import 'package:flutter/material.dart';

import './components/home_page.dart';

void main() {
  runApp(FashionApp());
}

class FashionApp extends StatefulWidget {
  @override
  _FashionAppState createState() => _FashionAppState();
}

class _FashionAppState extends State<FashionApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: Colors.white,

        accentColor: Colors.brown,
        tabBarTheme: TabBarTheme(
          labelColor: Colors.brown,
          unselectedLabelColor: Colors.brown.withOpacity(0.5)
        ),
        primaryTextTheme: TextTheme(
          /// headline6 -> title öğelerini temsil etmektedir.
          headline6: TextStyle(color: Colors.black)
        )

      ),
      home: HomePage(),
    );
  }
}
