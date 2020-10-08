import 'package:fashion_app/components/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

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
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          indicatorColor: Colors.transparent,
          controller: tabController,
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.shop)),
            Tab(icon: Icon(Icons.panorama)),
            Tab(icon: Icon(Icons.more)),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            height: 150,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                modelListElements('assets/images/model1.jpg', 'assets/images/chanellogo.jpg'),
                SizedBox(width: 30),

                modelListElements('assets/images/model2.jpg', 'assets/images/louisvuitton.jpg'),
                SizedBox(width: 30),

                modelListElements('assets/images/model3.jpg', 'assets/images/louisvuitton.jpg'),
                SizedBox(width: 30),

                modelListElements('assets/images/model4.jpg', 'assets/images/chanellogo.jpg'),
                SizedBox(width: 30),

                modelListElements('assets/images/model5.jpg', 'assets/images/louisvuitton.jpg'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 4,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 650,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Post Title Area
                    Container(
                      height: 75,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/model1.jpg'),
                                    fit: BoxFit.cover)),
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
                                  Text('Daisy',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Text('34 mins ago',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16)),
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
                    SizedBox(height: 15),

                    // Text Area
                    Container(
                      child: Text(
                          'Integer sit amet urna cursus libero imperdiet cursus. Pellentesque at molestie sem.'
                          ' Nam feugiat egestas lorem, eu vestibulum urna egestas dapibus. Aliquam ut aliquam massa.'),
                    ),
                    SizedBox(height: 15),

                    // Image Area
                    Expanded(
                      child: Row(
                        children: [
                          flexibleImageWrapper('assets/images/modelgrid1.jpg', 'assets/images/jacket.jpg'),
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                flexibleImageWrapper(
                                    'assets/images/modelgrid2.jpg', 'assets/images/dress.jpg'),
                                flexibleImageWrapper(
                                    'assets/images/modelgrid3.jpg', 'assets/images/blouse.jpg')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),

                    // Tag Area
                    Row(
                      children: [
                        tagWrapper(('#Louis Vuitton')),
                        tagWrapper(('#Anthing Tag')),
                      ],
                    ),

                    // Divider
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(thickness: 1),
                    ),

                    // Reply, Comment, Like
                    Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.reply,
                                    color: Colors.brown.withOpacity(0.5),
                                    size: 20),
                                SizedBox(width: 10),
                                Text('1.7k'),
                                SizedBox(width: 20),
                                Icon(Icons.comment,
                                    color: Colors.brown.withOpacity(0.5),
                                    size: 20),
                                SizedBox(width: 10),
                                Text('350'),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.favorite,
                                    color: Colors.red.withOpacity(0.8),
                                    size: 20),
                                SizedBox(width: 10),
                                Text('750'),
                              ],
                            ),
                          ),
                        )
                      ],
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

  Widget flexibleImageWrapper(String imagePath, String dressPath) {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(imagePath: imagePath, dressPath: dressPath,)));
        },

        child: Hero(
          tag: imagePath,
          child: Container(
            margin: EdgeInsets.all(3),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }

  Widget tagWrapper(String tagName) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.brown.withOpacity(0.5)),
      child: Text(tagName),
    );
  }
}
