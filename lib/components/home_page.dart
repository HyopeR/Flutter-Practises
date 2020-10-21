import 'package:flutter/material.dart';

import 'package:weather_forecast/components/last_update_widget.dart';
import 'package:weather_forecast/components/location_widget.dart';
import 'package:weather_forecast/components/temperature_range_widget.dart';
import 'package:weather_forecast/components/weather_state_image_widget.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {}
          ),
        ],
      ),

      body: Container(
        child: ListView(
          children: [

            Container(
              padding: EdgeInsets.all(10),
                child: Center(
                    child: LocationWidget()
                )
            ),

            Container(
                padding: EdgeInsets.all(10),
                child: Center(
                    child: LastUpdateWidget()
                )
            ),

            Container(
                padding: EdgeInsets.all(10),
                child: Center(
                    child: WeatherStateImageWidget()
                )
            ),

            Container(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: TemperatureRangeWidget()
                )
            ),

          ],
        ),
      ),
    );
  }
}
