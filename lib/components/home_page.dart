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
            height: 150,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                modelListElements(
                    'assets/images/model1.jpg', 'assets/images/chanellogo.jpg'),
                SizedBox(width: 30),
                modelListElements('assets/images/model2.jpg',
                    'assets/images/louisvuitton.jpg'),
                SizedBox(width: 30),
                modelListElements('assets/images/model3.jpg',
                    'assets/images/louisvuitton.jpg'),
                SizedBox(width: 30),
                modelListElements(
                    'assets/images/model4.jpg', 'assets/images/chanellogo.jpg'),
                SizedBox(width: 30),
                modelListElements('assets/images/model5.jpg',
                    'assets/images/louisvuitton.jpg'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 4,
              // color: Colors.blue.shade200,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 450,
                width: double.infinity,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 75,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 75,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  image: DecorationImage(image: AssetImage('assets/images/model1.jpg'), fit: BoxFit.cover)
                              ),
                            ),

                            Flexible(
                              flex: 4,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Daisy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                    Text('34 mins ago', style: TextStyle(color: Colors.grey, fontSize: 16)),
                                  ],
                                ),
                              ),
                            ),

                            Flexible(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.menu),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget modelListElements(String imagePath, String logoPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /// Stack widgeti içindeki elemanlar absolute olarak işaretlenir ve üst üst gelirler.
          Stack(
            children: <Widget>[
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                        image: AssetImage(imagePath), fit: BoxFit.cover)),
              ),
              Positioned(
                top: 50,
                left: 50,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(logoPath), fit: BoxFit.cover)),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),

          Container(
            alignment: Alignment.center,
            height: 30,
            width: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.brown),
            child: Text('Follow', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
