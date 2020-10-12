import 'dart:io';
import 'package:flutter/services.dart';
import 'package:notebook_app/models/category.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper;
  static Database _database;

  factory DatabaseHelper() {

    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    }else {
      return _databaseHelper;
    }

  }

  DatabaseHelper._internal();

  Future<Database> _getDatabase() async{
    if(_database == null) {
      _database = await _initializeDatabase();
      return _database;
    }else {
      return _database;
    }
  }

  Future<Database> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "notes.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets/db", "notes.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      await File(path).delete(recursive: true);
      print(path);
      print("Opening existing database");
    }
    // open the database
    return await openDatabase(path, readOnly: false);

  }

  Future<List<Category>> getCategories() async {
    var db = await _getDatabase();
    var categoriesMap = await db.query('category');

    // Type casting.
    List<Category> categories = categoriesMap.map((category) => Category.fromMap(category)).toList();
    return categories;
  }

}
