import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_guide/components/horoscope_list.dart';
import 'package:horoscope_guide/models/horoscope.dart';

class HoroscopeDetail extends StatelessWidget {

  int itemIndex;
  Horoscope selectedHoroscope;
  HoroscopeDetail(this.itemIndex);

  @override
  Widget build(BuildContext context) {

    selectedHoroscope = HoroscopeList.horoscopes[itemIndex];

    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: [

          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('images/${selectedHoroscope.horoscopeBigImage}', fit: BoxFit.cover,),
              title: Text('${selectedHoroscope.horoscopeName} and its Features'),
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
