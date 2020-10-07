import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Average Calculation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String lessonName;
  int lessonCredit = 1;
  double lessonCharValue = 4;

  List<Lesson> lessons;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    lessons = [];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Dynamic Average Calculation'),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          formKey.currentState.validate() ? formKey.currentState.save() : null;
        },
      ),

      body: applicationBody(),
    );
  }

  Widget applicationBody() {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Expanded(
            flex: 1,
            child: Container(
              // width: double.maxFinite,
              padding: EdgeInsets.all(10),
              child: Form(
                key: formKey,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 5, top: 5),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.book),
                          SizedBox(width: 5),
                          Text(
                              'Ders Formu',
                              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),

                    Divider(thickness: 2, color: Colors.grey[400]),
                    SizedBox(height: 15),

                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Ders Adı',
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: 'Ders adını giriniz',
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[400],
                                width: 2
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                      ),

                      validator: (value) => value.length < 0 ? 'Ders adı boş olamaz.' : null,

                      onSaved: (value) {
                        setState(() => lessonName = value);
                        lessons.add(Lesson(lessonName, lessonCharValue, lessonCredit));
                      },
                    ),

                    Row(
                      children: <Widget>[

                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[400], width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),

                            child: DropdownButton<int>(
                              isExpanded: true,
                              underline: Container(),
                              items: lessonCreditItems(),
                              value: lessonCredit,
                              onChanged: (value) => setState(() => lessonCredit = value),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(left: 3, top: 10),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[400], width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),

                            child: DropdownButton<double>(
                              isExpanded: true,
                              underline: Container(),
                              items: lessonCharValueItems(),
                              value: lessonCharValue,
                              onChanged: (value) => setState(() => lessonCharValue = value),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(left: 3, top: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[400], width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),

                            child: Text('Ortalama: ', style: TextStyle(fontSize: 18))
                            ),
                          ),

                      ],
                    ),
                  ],

                ),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              // width: double.maxFinite,
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                  itemBuilder: _createListItem,
                  itemCount: lessons.length,
                )
              ),
            ),


        ],

      ),
    );

  }

  List<DropdownMenuItem<int>> lessonCreditItems() {

    List<DropdownMenuItem<int>> creditItems = [];

    for(int i = 1; i <= 10; i++){
      creditItems.add(
          DropdownMenuItem<int> (
            value: i,
            child: Text('$i Kredi', style: TextStyle(fontSize: 18),),
          )
      );
    }

    return creditItems;
  }

  List<DropdownMenuItem<double>> lessonCharValueItems() {

    List<DropdownMenuItem<double>> lessonCharItems = [];
    lessonCharItems.add(DropdownMenuItem(child: Text('AA', style: TextStyle(fontSize: 18)), value: 4));
    lessonCharItems.add(DropdownMenuItem(child: Text('BA', style: TextStyle(fontSize: 18)), value: 3.5));
    lessonCharItems.add(DropdownMenuItem(child: Text('BB', style: TextStyle(fontSize: 18)), value: 3));
    lessonCharItems.add(DropdownMenuItem(child: Text('CB', style: TextStyle(fontSize: 18)), value: 2.5));
    lessonCharItems.add(DropdownMenuItem(child: Text('CC', style: TextStyle(fontSize: 18)), value: 2));
    lessonCharItems.add(DropdownMenuItem(child: Text('DC', style: TextStyle(fontSize: 18)), value: 1.5));
    lessonCharItems.add(DropdownMenuItem(child: Text('DD', style: TextStyle(fontSize: 18)), value: 1));
    lessonCharItems.add(DropdownMenuItem(child: Text('FF', style: TextStyle(fontSize: 18)), value: 0));

    return lessonCharItems;

  }

  Widget _createListItem(BuildContext context, int index){

    return Card(
      elevation: 2.5,
      child: ListTile(
        contentPadding: EdgeInsets.all(5),
        title: Text(lessons[index].name),
        subtitle: Text('Kredi Değeri: ${lessons[index].creditValue.toString()}\nHarf Değeri: ${lessons[index].charValue.toString()}'),
      ),
    );

  }


}

class Lesson {

  String name;
  double charValue;
  int creditValue;

  Lesson(this.name, this.charValue, this.creditValue);

}
