import 'package:flutter/material.dart';
import '../models/Pokemon.dart';

class PokemonDetail extends StatefulWidget {

  Pokemon pokemon;
  PokemonDetail({this.pokemon});

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(widget.pokemon.name),
      ),

      body: Container(
        color: Colors.grey,
        child: Stack(
          children: [

            Positioned(
              height: (MediaQuery.of(context).size.height * 6) / 10,
              width: (MediaQuery.of(context).size.width * 8) / 10,
              left: (MediaQuery.of(context).size.width) / 10,
              bottom: 20,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: [

                      Text(widget.pokemon.name, style: TextStyle(fontSize: 20),)
                      
                    ],
                  ),
                )
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: widget.pokemon.img,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 200,
                  height: 200,
                  child: Image.network(widget.pokemon.img, fit: BoxFit.cover,),
                ),
              ),
            )

          ],
        ),
      ),

    );
  }
}
