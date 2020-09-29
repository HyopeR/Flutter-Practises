import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import 'horoscope_list.dart';
import '../models/horoscope.dart';

/// Stateless widget üzerine gelip ALT + ENTER basarsak onu otomatik olarak stateful widgete convertleyebiliriz.
class HoroscopeDetail extends StatefulWidget {
  int itemIndex;

  HoroscopeDetail(this.itemIndex);

  @override
  _HoroscopeDetailState createState() => _HoroscopeDetailState();
}

class _HoroscopeDetailState extends State<HoroscopeDetail> {
  Horoscope selectedHoroscope;
  Color dynamicAppbarColor;
  PaletteGenerator paletteGenerator;

  /// initState constructordan sonra çalışan bir fonksiyondur. Build metodundan önce çalışmaktadır.
  /// Dolayısıyla constructordaki işlemlerden sonra yapacağımız herhangi bir işlem için uygundur.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedHoroscope = HoroscopeList.horoscopes[widget.itemIndex];
    getDynamicAppbarColor();
  }

  void getDynamicAppbarColor() {

    Future<PaletteGenerator> getPalette = PaletteGenerator.fromImageProvider(AssetImage('images/${selectedHoroscope.horoscopeBigImage}'));
    getPalette.then((palette) {
      paletteGenerator = palette;
      // print('${palette.dominantColor.color}');

      setState(() {
        dynamicAppbarColor = palette.vibrantColor.color;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: dynamicAppbarColor != null ? dynamicAppbarColor : Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/${selectedHoroscope.horoscopeBigImage}',
                fit: BoxFit.cover,
              ),
              title:
                  Text('${selectedHoroscope.horoscopeName} and its Features'),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                child: Text(
                  '${selectedHoroscope.horoscopeDetail}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
