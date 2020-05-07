import 'package:Earshot/db/book-model.dart';
import 'package:Earshot/db/db.dart';
import 'package:flutter/material.dart';

class MyLibrary extends StatefulWidget {
  @override
  _MyLibrary createState() => _MyLibrary();
}

class _MyLibrary extends State<MyLibrary> {
  List<Books> library = List();

  void getBooks() async {
    library = await DBFunctions.getAllBooks();
    setState(() {
      library = library;
    });
  }

  @override
  void initState() {
    super.initState();
    getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: const Color(0XFFCDBFBC),
              ),
          itemCount: library.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(library[index].title,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                          height: 1.2)),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      library[index].author,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: const Color(0XFFCDBFBC),
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
