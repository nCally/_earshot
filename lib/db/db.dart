import 'dart:io';

import 'package:Earshot/db/book-model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class DatabaseCreator {
  static const booksTable = 'books';
  static const id = 'id';
  static const title = 'title';
  static const author = 'author';
  static const year = 'year';

  Future<void> createBooksTable(Database db) async {
    final createSql = '''
    CREATE TABLE $booksTable 
    (
      $id INTEGER PRIMARY KEY AUTOINCREMENT,
      $title TEXT,
      $author TEXT,
      $year TEXT
    )
    ''';

    await db.execute(createSql);
  }

// Get the database path
  Future<String> getDbPath(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    // check if the db already exists
    if (await Directory(dirname(path)).exists()) {
      // maybe remove it
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }

    return path;
  }

// Initialize the database here
  Future<void> initDb() async {
    final path = await getDbPath('books');
    db = await openDatabase(path, version: 1, onCreate: createDb);
    print(db);
  }

// Create onCreate
  Future<void> createDb(Database db, int version) async {
    await createBooksTable(db);
  }
}

class DBFunctions {
  static Future<List<Books>> getAllBooks() async {
    final sql = '''
    SELECT * FROM ${DatabaseCreator.booksTable}
    ''';

    final data = await db.rawQuery(sql);

    List<Books> books = List();

    for (final node in data) {
      final book = Books.fromJson(node);
      books.add(book);
    }

    return books;
  }

  static Future<int> addBook(Books books) async {
    final sql = '''
    INSERT INTO ${DatabaseCreator.booksTable} 
    (
      ${DatabaseCreator.title},
      ${DatabaseCreator.author},
      ${DatabaseCreator.year}
    ) 
    VALUES (?,?,?)
    ''';

    List<dynamic> params = [books.title, books.author, books.year];
    return await db.rawInsert(sql, params);
  }
}
