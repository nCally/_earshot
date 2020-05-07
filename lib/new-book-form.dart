import 'package:Earshot/db/book-model.dart';
import 'package:Earshot/db/db.dart';
import 'package:flutter/material.dart';

class NewBookForm extends StatefulWidget {
  @override
  _NewBookForm createState() => _NewBookForm();
}

class _NewBookForm extends State<NewBookForm> {
  final _formKey = GlobalKey<FormState>();

  final _title = TextEditingController();
  final _author = TextEditingController();
  final _year = TextEditingController();

  Future<void> addBook(Books books) async {
    final result = await DBFunctions.addBook(books);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(15.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'CREATE BOOK',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  controller: _title,
                  maxLines: null,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFFCDBFBC)),
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(
                          color: const Color(0XFFCDBFBC), fontSize: 16.0),
                      contentPadding: EdgeInsets.all(5.0),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0XFFCDBFBC))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0XFFCDBFBC)))),
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  controller: _author,
                  maxLines: null,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFFCDBFBC)),
                  decoration: InputDecoration(
                      labelText: 'Author',
                      labelStyle: TextStyle(
                          color: const Color(0XFFCDBFBC), fontSize: 16.0),
                      contentPadding: EdgeInsets.all(5.0),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0XFFCDBFBC))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0XFFCDBFBC)))),
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: _year,
                  maxLines: null,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFFCDBFBC)),
                  decoration: InputDecoration(
                      labelText: 'Year',
                      labelStyle: TextStyle(
                          color: const Color(0XFFCDBFBC), fontSize: 16.0),
                      contentPadding: EdgeInsets.all(5.0),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0XFFCDBFBC))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0XFFCDBFBC)))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Container(
                    height: 60.0,
                    width: 300.0,
                    child: RaisedButton(
                      color: const Color(0XFFCE9073),
                      child: Text(
                        'Save book',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFFCDBFBC)),
                      ),
                      onPressed: () async {
                        final newBook = new Books(
                            title: _title.text,
                            author: _author.text,
                            year: _year.text);
                        addBook(newBook);
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
