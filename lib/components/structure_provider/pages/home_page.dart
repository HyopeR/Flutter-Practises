import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_forecast/components/structure_provider/pages/select_city_page.dart';

import 'package:weather_forecast/components/structure_provider/widgets/last_update_widget.dart';
import 'package:weather_forecast/components/structure_provider/widgets/location_widget.dart';
import 'package:weather_forecast/components/structure_provider/widgets/temperature_range_widget.dart';
import 'package:weather_forecast/components/structure_provider/widgets/weather_state_image_widget.dart';
import 'package:weather_forecast/stores/store_provider/weather_view_model.dart';


class HomePageProvider extends StatefulWidget {

  @override
  _HomePageProviderState createState() => _HomePageProviderState();
}

class _HomePageProviderState extends State<HomePageProvider> {
  String selectedCity = 'Bilecik';
  WeatherViewModel _weatherView;

  @override
  void dispose() {
    _weatherView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _weatherView = Provider.of<WeatherViewModel>(context);
    return Theme(
      data: ThemeData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weather Forecast Provider'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {

                  selectedCity = await Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCityPage()));
                  // debugPrint(selectedCity);
                  _weatherView.getWeather(cityName: selectedCity);
                }
            ),
          ],
        ),

        body: Container(
          child: PageChange(),
        ),
      ),
    );
  }

  Widget PageChange() {

    switch(_weatherView.state) {
      case(WeatherState.WeatherInitialState):
        return Center(child: Text('Şehir seçiniz.'));
        break;

      case(WeatherState.WeatherLoadingState):
        return Center(child: CircularProgressIndicator());
        break;

      case(WeatherState.WeatherLoadedState):
        return ListView(
          children: [

            Container(
                padding: EdgeInsets.all(10),
                child: Center(
                    child: LocationWidget(
                      selectedCity: _weatherView.weather.title,
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
        );
        break;

      case(WeatherState.WeatherErrorState):
        return Center(child: Text('Bir hata oluştu.'));
        break;

      default:
        return Container();
        break;

    }



  }
}


