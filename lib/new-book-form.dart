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
        padding: EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 75.0,
              ),
              Text('New book'),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Title of audio book',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Author'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Year'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
