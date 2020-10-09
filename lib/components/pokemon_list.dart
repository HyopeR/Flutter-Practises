import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/components/pokemon_detail.dart';
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
        ? OrientationBuilder(builder: (context, orientation){
          int dynamicRowCount = orientation == Orientation.portrait ? 2 : 3;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: dynamicRowCount),
            itemCount: pokedex.length,
            itemBuilder: (context, index) {

              Pokemon currentPokemon = pokedex[index];

              return InkWell(

                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PokemonDetail(pokemon: currentPokemon)));
                },

                child: Hero(
                  tag: currentPokemon.img,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Card(
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Container(
                            width: 150,
                            height: 150,
                            child: FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: currentPokemon.img),
                          ),
                          Text(currentPokemon.name, style: TextStyle(fontSize: 18))

                        ],
                      ),
                    ),
                  ),
                ),
              );

            },
          );

        })
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
