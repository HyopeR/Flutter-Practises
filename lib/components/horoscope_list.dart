import 'package:flutter/material.dart';

import '../utils/data.dart';
import '../models/horoscope.dart';

class HoroscopeList extends StatelessWidget {

  /// Eğer bir sınıfın içerisindeki bir veriye diğer componentlerden direkt olarak erişmek istiyorsak
  /// doldurmuş olduğumuz veriyi static olarak belirleyerek diğer componentlerden bu veriye ulaşabiliriz.
  static List<Horoscope> horoscopes;

  @override
  Widget build(BuildContext context) {

    horoscopes = getHoroscopes();

    return Scaffold(
      appBar: AppBar(title: Text('Horoscope Guide'), centerTitle: true,),
      body: prepareHoroscopeList(),
    );
  }

  List<Horoscope> getHoroscopes() {

    List<Horoscope> temporaryHoroscopes = [];
    for(int i = 0; i < 12; i++) {

      String smallImage = '${Datas.HOROSCOPE_NAMES[i].toLowerCase()}${i+1}.png';
      String bigImage = '${Datas.HOROSCOPE_NAMES[i].toLowerCase()}_buyuk${i+1}.png';

      Horoscope newHoroscope = Horoscope(
        Datas.HOROSCOPE_NAMES[i],
        Datas.HOROSCOPE_DATES[i],
        Datas.HOROSCOPE_GENERAL_FEATURES[i],
        smallImage,
        bigImage
      );

      temporaryHoroscopes.add(newHoroscope);
    }

    return temporaryHoroscopes;
  }

  Widget prepareHoroscopeList() {
    return ListView.builder(
      itemCount: horoscopes.length,
      itemBuilder: (BuildContext context, int index) {
        return prepareHoroscopeListItem(context, index);
      }
    );
  }

  Widget prepareHoroscopeListItem(BuildContext context, int index) {

    Horoscope currentHoroscope = horoscopes[index];

    /// Kısayol önerisi: Örneğin Card Widgetine mouse ile tıkladıktan sonra 2 kez CTRL + W basarsak
    /// Card widgetini içindeki tüm elemanlarıyla kısayoldan seçebiliriz.
    /// İçindeki bütün elemanlarıyla seçtikten sonra ALT + ENTER basarsak başka bir widget ile çevreleyebiliriz.

    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: ListTile(

          onTap: () => { Navigator.pushNamed(context, '/horoscopeDetail/$index') },
          // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HoroscopeDetail())),

          leading: Image.asset(
              'images/${currentHoroscope.horoscopeSmallImage}',
              width: 64,
              height: 64
          ),

          title: Text(
            currentHoroscope.horoscopeName,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.pink[300]
            ),
          ),

          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              currentHoroscope.horoscopeDate,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[800]
              ),
            ),
          ),

          trailing: Icon(Icons.arrow_forward_ios, color: Colors.pink),


        ),
      ),
    );
  }
}
