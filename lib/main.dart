import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.orange,
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.white, fontSize: 20),
          )
      ),
        accentColor: Colors.deepOrange.shade400,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black, fontSize: 16),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PokemonList(),
    );
  }
}
