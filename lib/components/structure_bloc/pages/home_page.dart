import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_forecast/components/structure_bloc//pages/select_city_page.dart';

import 'package:weather_forecast/components/structure_bloc//widgets/last_update_widget.dart';
import 'package:weather_forecast/components/structure_bloc//widgets/location_widget.dart';
import 'package:weather_forecast/components/structure_bloc//widgets/temperature_range_widget.dart';
import 'package:weather_forecast/components/structure_bloc//widgets/weather_state_image_widget.dart';


import 'package:weather_forecast/stores/store_bloc/weather_bloc.dart';


class HomePageBloc extends StatefulWidget {

  @override
  _HomePageBlocState createState() => _HomePageBlocState();
}

class _HomePageBlocState extends State<HomePageBloc> {
  String selectedCity = 'Bilecik';
  WeatherBloc _weatherBloc;

  @override
  void initState() {
    super.initState();
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);

  }

  @override
  void dispose() {
    _weatherBloc.close();
    super.dispose();
  }

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

                if(selectedCity != null) {
                  _weatherBloc.add(FetchWeatherEvent(cityName: selectedCity));
                }

              }
          ),
        ],
      ),

      body: Container(
        child: BlocBuilder(
          cubit: _weatherBloc,
          builder: (context, WeatherState state) {

            if(state is WeatherInitialState) {
              return Center(child: Text('Şehir seçiniz.'));
            }

            if(state is WeatherLoadingState) {
              return Center(child: CircularProgressIndicator());
            }

            if(state is WeatherLoadedState) {

              final weather = state.weather;

              return ListView(
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
              );
            }

            if(state is WeatherErrorState) {
              return Center(child: Text('Hata olıştu.'));
            }

            return Container();


          },
        ),
      ),
    );
  }
}
