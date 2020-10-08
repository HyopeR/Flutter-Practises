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
        primaryColor: Colors.grey.shade200,
        accentColor: Colors.brown,
        primaryTextTheme: TextTheme(
          /// headline6 -> title öğelerini temsil etmektedir.
          headline6: TextStyle(color: Colors.black)
        )

      ),
      home: HomePage(),
    );
  }
}
