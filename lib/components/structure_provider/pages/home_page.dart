import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_forecast/components/structure_provider/pages/select_city_page.dart';

import 'package:weather_forecast/components/structure_provider/widgets/last_update_widget.dart';
import 'package:weather_forecast/components/structure_provider/widgets/location_widget.dart';
import 'package:weather_forecast/components/structure_provider/widgets/temperature_range_widget.dart';
import 'package:weather_forecast/components/structure_provider/widgets/weather_state_image_widget.dart';
import 'package:weather_forecast/stores/store_provider/theme_view_model.dart';
import 'package:weather_forecast/stores/store_provider/weather_view_model.dart';


class HomePageProvider extends StatefulWidget {

  @override
  _HomePageProviderState createState() => _HomePageProviderState();
}

class _HomePageProviderState extends State<HomePageProvider> {
  String selectedCity = 'Bilecik';
  WeatherViewModel _weatherView;
  ThemeViewModel _themeView;

  @override
  Widget build(BuildContext context) {
    _weatherView = Provider.of<WeatherViewModel>(context);
    _themeView = Provider.of<ThemeViewModel>(context);
    return Theme(
      data: _themeView.themeModel.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weather Forecast Provider'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {

                  selectedCity = await Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCityPage(_themeView)));
                  // debugPrint(selectedCity);
                  await _weatherView.getWeather(cityName: selectedCity);
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

        return WeatherPage(selectedCity);
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

class WeatherPage extends StatefulWidget {

  String cityName;
  WeatherPage(String cityName);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}


class _WeatherPageState extends State<WeatherPage> {
  WeatherViewModel _weatherView;
  ThemeViewModel _themeView;

  @override
  void initState() {
    super.initState();

    /// Bu fonksiyon build metodu hemen bittikten sonra tetiklenen bir lifecycle fonksiyondur.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _themeView.changeTheme(weatherStateAbbr: _weatherView.weather.consolidatedWeather[0].weatherStateAbbr);
    });
  }

  @override
  Widget build(BuildContext context) {
    _weatherView = Provider.of<WeatherViewModel>(context);
    _themeView = Provider.of<ThemeViewModel>(context);
    return RefreshIndicator(
      onRefresh: () async {
        _weatherView.refreshWeather(cityName: widget.cityName);
      },
      child: ListView(
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
      ),
    );
  }
}

