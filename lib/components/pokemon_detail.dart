import 'package:flutter/material.dart';
import '../models/Pokemon.dart';
import 'package:palette_generator/palette_generator.dart';

class PokemonDetail extends StatefulWidget {
  Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  Color dynamicAppbarColor;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDynamicAppbarColor(widget.pokemon.img);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dynamicAppbarColor != null ? dynamicAppbarColor : Colors.orange,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(widget.pokemon.name),
        backgroundColor: dynamicAppbarColor != null ? dynamicAppbarColor : Colors.orange,
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? verticalBody(context)
            : horizontalBody(context);
      }),
    );
  }

  void getDynamicAppbarColor(String pokemonImg) {

    Future<PaletteGenerator> getPalette = PaletteGenerator.fromImageProvider(NetworkImage(pokemonImg));
    getPalette.then((palette) {
      paletteGenerator = palette;
      setState(() {
        dynamicAppbarColor = palette.dominantColor.color;
      });
    });

  }
  
  Stack verticalBody(BuildContext context){
    return Stack(
      children: [
        Positioned(
          height: (MediaQuery.of(context).size.height * 6) / 10,
          width: (MediaQuery.of(context).size.width * 8) / 10,
          left: (MediaQuery.of(context).size.width) / 10,
          bottom: 20,
          child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding: EdgeInsets.only(
                    top: 50, left: 20, right: 20, bottom: 20),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Flexible(
                      child: ListView(
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        maxRadius: 16,
                                        child: Text(
                                          widget.pokemon.num,
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    SizedBox(width: 10),
                                    Text(widget.pokemon.name,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25),
                              Text('Height: ${widget.pokemon.height}',
                                  style: TextStyle(fontSize: 16)),
                              Text('Weight: ${widget.pokemon.weight}',
                                  style: TextStyle(fontSize: 16)),

                              SizedBox(height: 10),
                              Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: widget.pokemon.type
                                    .map((type) => Container(
                                    margin: EdgeInsets.all(2),
                                    child: Chip(label: Text(type))))
                                    .toList(),
                              ),

                              SizedBox(height: 10),
                              Text('Prev Evolution', style: TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: widget.pokemon.prevEvolution != null
                                    ? widget.pokemon.prevEvolution
                                    .map((evolution) => Container(
                                    margin: EdgeInsets.all(2),
                                    child: Chip(
                                        label: Text(evolution.name))))
                                    .toList()
                                    : [Text('İlk hali.')],
                              ),

                              SizedBox(height: 10),
                              Text('Next Evolution', style: TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: widget.pokemon.nextEvolution != null
                                    ? widget.pokemon.nextEvolution
                                    .map((evolution) => Container(
                                    margin: EdgeInsets.all(2),
                                    child: Chip(
                                        label: Text(evolution.name))))
                                    .toList()
                                    : [Text('Son evrim.')],
                              ),

                              SizedBox(height: 10),
                              Text('Weaknesses', style: TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: widget.pokemon.weaknesses != null
                                    ? widget.pokemon.weaknesses
                                    .map((weakness) => Container(
                                    margin: EdgeInsets.all(2),
                                    child: Chip(label: Text(weakness))))
                                    .toList()
                                    : [Text('Zayıflık yok.')],
                              ),
                            ],
                          )

                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: widget.pokemon.img,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: 180,
              height: 180,
              child: Image.network(
                widget.pokemon.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
  
  Widget horizontalBody(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height - 20,
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Expanded(
              flex: 1,
              child: Hero(
                tag: widget.pokemon.img,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 180,
                  height: 180,
                  child: Image.network(
                    widget.pokemon.img,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(15),
                child: ListView(
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  backgroundColor:
                                  Colors.grey,
                                  maxRadius: 16,
                                  child: Text(
                                    widget.pokemon.num,
                                    style: TextStyle(color: Colors.white),
                                  )),
                              SizedBox(width: 10),
                              Text(widget.pokemon.name,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                        Text('Height: ${widget.pokemon.height}',
                            style: TextStyle(fontSize: 16)),
                        Text('Weight: ${widget.pokemon.weight}',
                            style: TextStyle(fontSize: 16)),

                        SizedBox(height: 10),
                        Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: widget.pokemon.type
                              .map((type) => Container(
                              margin: EdgeInsets.all(2),
                              child: Chip(label: Text(type))))
                              .toList(),
                        ),

                        SizedBox(height: 10),
                        Text('Prev Evolution', style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: widget.pokemon.prevEvolution != null
                              ? widget.pokemon.prevEvolution
                              .map((evolution) => Container(
                              margin: EdgeInsets.all(2),
                              child: Chip(
                                  label: Text(evolution.name))))
                              .toList()
                              : [Text('İlk hali.')],
                        ),

                        SizedBox(height: 10),
                        Text('Next Evolution', style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: widget.pokemon.nextEvolution != null
                              ? widget.pokemon.nextEvolution
                              .map((evolution) => Container(
                              margin: EdgeInsets.all(2),
                              child: Chip(
                                  label: Text(evolution.name))))
                              .toList()
                              : [Text('Son evrim.')],
                        ),

                        SizedBox(height: 10),
                        Text('Weaknesses', style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: widget.pokemon.weaknesses != null
                              ? widget.pokemon.weaknesses
                              .map((weakness) => Container(
                              margin: EdgeInsets.all(2),
                              child: Chip(label: Text(weakness))))
                              .toList()
                              : [Text('Zayıflık yok.')],
                        ),
                      ],
                    )

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
