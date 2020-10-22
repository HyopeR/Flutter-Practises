import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/stores/store_bloc/theme/theme_bloc.dart';

class SelectCityPage extends StatefulWidget {

  ThemeBloc _themeBloc;
  SelectCityPage(this._themeBloc);

  @override
  _SelectCityPageState createState() => _SelectCityPageState();
}

class _SelectCityPageState extends State<SelectCityPage> {

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: widget._themeBloc,
      builder: (context, ThemeState state) => Theme(
        data: (state as ThemeInitial).theme != null ? (state as ThemeInitial).theme : ThemeData(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Select City'),
            centerTitle: true,
          ),

          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Form(
              child: Row(
                children: [

                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(
                        labelText: 'City',
                        hintText: 'Select City',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          )
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      height: 60,
                      color: (state as ThemeInitial).color,
                      child: Icon(Icons.search),
                      onPressed: () {
                        Navigator.pop(context, _textController.text);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
