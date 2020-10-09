import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Pokemon.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  String url = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  List<Pokemon> pokedex;
  bool pokedexController = false;

  @override
  void initState() {
    super.initState();
    getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pokedex'),
      ),

      body: pokedexController
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => Text(pokedex[index].name),
          )
        : Center(child: CircularProgressIndicator())
    );
  }

  getPokemons() async {
    var response = await http.get(url);
    var decodedJson = jsonDecode(response.body);

    setState(() {
      pokedex = (decodedJson['pokemon'] as List).map((pokemon) => Pokemon.fromJson(pokemon)).toList();
      pokedexController = true;
    });

  }
}
