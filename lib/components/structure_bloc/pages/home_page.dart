import 'package:flutter/material.dart';

import 'package:weather_forecast/components/structure_bloc//pages/select_city_page.dart';

import 'package:weather_forecast/components/structure_bloc//widgets/last_update_widget.dart';
import 'package:weather_forecast/components/structure_bloc//widgets/location_widget.dart';
import 'package:weather_forecast/components/structure_bloc//widgets/temperature_range_widget.dart';
import 'package:weather_forecast/components/structure_bloc//widgets/weather_state_image_widget.dart';


class HomePageBloc extends StatelessWidget {

  String selectedCity = 'Bilecik';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast Bloc'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {

                selectedCity = await Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCityPage()));
                // debugPrint(selectedCity);

              }
          ),
        ],
      ),

      body: Container(
        child: ListView(
          children: [

            Container(
              padding: EdgeInsets.all(10),
                child: Center(
                    child: LocationWidget(
                      selectedCity: selectedCity,
                    )
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
