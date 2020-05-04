import 'package:flutter/material.dart';

class NewBookForm extends StatefulWidget {
  @override
  _NewBookForm createState() => _NewBookForm();
}

class _NewBookForm extends State<NewBookForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(15.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Create book',
              style: TextStyle(fontSize: 32.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.multiline,
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
                RaisedButton(
                  child: Text(
                    'Save book',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
