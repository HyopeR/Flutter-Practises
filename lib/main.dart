import 'package:flutter/material.dart';
import 'package:notebook_app/models/category.dart';
import 'package:notebook_app/utils/database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notebook',
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
  DatabaseHelper dbHelper = DatabaseHelper();
  List<Category> categories;

  @override
  void initState() {
    super.initState();
    dbHelper.getCategories().then((dataCategories) => categories = dataCategories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notebook'),
      ),
      body: Center(
        child: Text(
          'Notebook application',
        ),
      ),
    );
  }
}
