import 'package:Earshot/db/db.dart';

class Books {
  int id;
  String title;
  String author;
  String year;

  Books({this.id, this.title, this.author, this.year});

  Books.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.title = json[DatabaseCreator.title];
    this.author = json[DatabaseCreator.author];
    this.year = json[DatabaseCreator.year];
  }
}
