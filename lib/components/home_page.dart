import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Home Page',
          style: TextStyle(),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),

          IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: () {},
          )
        ],
      ),

      body: ListView(

        children: <Widget>[

          Container(
            color: Colors.blue.shade300,
            height: 150,
            width: double.infinity,

            child: ListView(
              scrollDirection: Axis.horizontal,

              children: <Widget>[

                modelListElements('assets/images/model1.jpg', 'assets/images/chanellogo.jpg'),
                modelListElements('assets/images/model2.jpg', 'assets/images/chanellogo.jpg'),
                modelListElements('assets/images/model3.jpg', 'assets/images/chanellogo.jpg'),
                modelListElements('assets/images/model4.jpg', 'assets/images/chanellogo.jpg'),
                modelListElements('assets/images/model5.jpg', 'assets/images/chanellogo.jpg'),

              ],
            ),
          )

        ],

      ),
    );
  }

  Widget modelListElements(String imagePath, String logoPath) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        /// Stack widgeti içindeki elemanlar absolute olarak işaretlenir ve üst üst gelirler.
        Stack(
          children: <Widget>[

            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)
              ),
            ),

            Positioned(
              top: 50,
              left: 50,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage(logoPath), fit: BoxFit.cover)
                ),
              ),
            )

          ],
        )

      ],

    );

  }
}
