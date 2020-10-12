import 'dart:io';
import 'package:flutter/services.dart';
import 'package:notebook_app/models/category.dart';
import 'package:notebook_app/models/note.dart';
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

  // Kategoriler ile ilgili sorgular.
  Future<List<Category>> getCategories() async {
    var db = await _getDatabase();
    var categoriesMap = await db.query('category');

    // Type casting.
    List<Category> categories = categoriesMap.map((category) => Category.fromMap(category)).toList();
    return categories;
  }

  Future<int> addCategory(Category category) async {
    var db = await _getDatabase();
    var result = await db.insert('category', category.toMap());

    return result;
  }

  Future<int> updateCategory(Category category) async {
    var db = await _getDatabase();
    var result = await db.update('category', category.toMap(), where: 'categoryId = ?', whereArgs: [category.categoryId]);

    return result;
  }

  Future<int> deleteCategory(int categoryId) async {
    var db = await _getDatabase();
    var result = await db.delete('category', where: 'categoryId = ?', whereArgs: [categoryId]);

    return result;
  }



  // Notlar ile ilgili sorgular.
  Future<List<Note>> getNotes() async {
    var db = await _getDatabase();
    var notesMap = await db.query('note', orderBy: 'noteId DESC');

    // Type casting.
    List<Note> notes = notesMap.map((note) => Note.fromMap(note)).toList();
    return notes;
  }

  Future<int> addNote(Note note) async {
    var db = await _getDatabase();
    var result = await db.insert('note', note.toMap());

    return result;
  }

  Future<int> updateNote(Note note) async {
    var db = await _getDatabase();
    var result = await db.update('note', note.toMap(), where: 'noteId = ?', whereArgs: [note.noteId]);

    return result;
  }

  Future<int> deleteNote(int noteId) async {
    var db = await _getDatabase();
    var result = await db.delete('note', where: 'noteId = ?', whereArgs: [noteId]);

    return result;
  }

}
