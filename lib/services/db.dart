import 'dart:async';

import 'package:Earshot/models/index.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Database _db;
  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + 'example';
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (e) {
      print(e);
    }
  }

  static void onCreate(Database db, int version) async {
    return await db.execute(
        'CREATE TABLE books(id INTEGER PRIMARY KEY, title TEXT, author TEXT)');
  }

  static Future<void> insertBook(Books books) async {
    await _db.insert('books', books.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Books>> getBooks() async {
    final List<Map<String, dynamic>> map = await _db.query('books');

    return List.generate(map.length, (i) {
      return Books(
          id: map[i]['id'], title: map[i]['title'], author: map[i]['author']);
    });
  }
}
