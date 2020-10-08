import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {

  var imagePath;
  DetailPage({this.imagePath});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.imagePath,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          decoration: BoxDecoration(
            image: DecorationImage(

              image: AssetImage(widget.imagePath),
              fit: BoxFit.cover,
            )
          )
        ),
      ),
    );
  }
}
