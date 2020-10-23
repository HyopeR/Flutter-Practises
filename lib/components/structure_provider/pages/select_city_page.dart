import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/stores/store_provider/theme_view_model.dart';

class SelectCityPage extends StatefulWidget {
  ThemeViewModel themeView;
  SelectCityPage(this.themeView);

  @override
  _SelectCityPageState createState() => _SelectCityPageState();
}

class _SelectCityPageState extends State<SelectCityPage> {
  final _textController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Theme(
      data: widget.themeView.themeModel.theme,
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
                    color: widget.themeView.themeModel.color,
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
    );
  }
}
