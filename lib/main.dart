import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_forecast/components/structure_bloc/pages/home_page.dart';
import 'package:weather_forecast/components/structure_provider/pages/home_page.dart';
import 'package:weather_forecast/locator.dart';
import 'package:weather_forecast/stores/store_bloc/weather_bloc.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Forecast',

      initialRoute: '/',
      routes: {
        '/': (context) => NavigateClass(),
        '/blocPattern': (context) => BlocProvider(
            create: (context) => WeatherBloc(),
            child: HomePageBloc()
        ),
        '/providerPackage': (context) => HomePageProvider(),
      },
      onUnknownRoute: (RouteSettings settings) =>
          MaterialPageRoute(builder: (context) => NavigateClass()),

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class NavigateClass extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Weather Forecast Select Structure',
                style: TextStyle(color: Colors.white)),
            centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: <Widget>[

                Container(
                  child: Text('Hava durumu uygulaması State Management için kullanılan 2 yapının denemesi için yapılmıştır.'
                      'Bu yapılardan biri Provider paketi, diğeri ise Bloc Pattern yapısıdr.', textAlign: TextAlign.center,),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/blocPattern');
                    },
                    leading: Icon(Icons.adjust),
                    title: Text('Bloc Pattern with Application', style: TextStyle(fontSize: 18)),
                    trailing: Icon(Icons.arrow_right),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/providerPackage');
                    },
                    leading: Icon(Icons.adjust),
                    title: Text('Provider with Application', style: TextStyle(fontSize: 18)),
                    trailing: Icon(Icons.arrow_right),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                )

              ],
            ),
          ),
        ));
  }
}

