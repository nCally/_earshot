import 'package:Earshot/db/book-model.dart';
import 'package:Earshot/db/db.dart';
import 'package:Earshot/new-book-form.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseCreator().initDb();

  return runApp(EarshotApp());
}

class EarshotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EarShot',
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: const Color(0XFF2B3B46),
          accentColor: const Color(0XFFCE9073),
          canvasColor: Colors.transparent,
          textTheme: TextTheme(
              body1: TextStyle(fontSize: 36, color: const Color(0XFFCDBFBC)),
              body2: TextStyle(fontSize: 18, color: const Color(0XFFCDBFBC)))),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _current = true;
  Future<List<Books>> booksList;

  void setCurrent() {
    setState(() {
      _current = !_current;
    });
  }

  @override
  void initState() {
    super.initState();
    booksList = DBFunctions.getAllBooks();
  }

  void _openNewBookModal() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return Container(
            color: Colors.transparent,
            height: 650.0,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: NewBookForm(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Container(
            padding: EdgeInsets.all(20.0),
            child: Padding(
              padding: EdgeInsets.only(top: 115.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () async {
                              /* Books newBook = Books(
                                  id: 1,
                                  title:
                                      'Essentialism: Disciplined pursuit of less',
                                  author: 'Greg Mckeown',
                                  year: '2004');
                              await DBFunctions.addBook(newBook); */

                              setState(() {
                                _current = true;
                              });
                            },
                            child: Opacity(
                              opacity: _current == true ? 1.0 : 0.3,
                              child: Container(
                                child: Text('Recent',
                                    style: Theme.of(context).textTheme.body1),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _current = false;
                                  });
                                },
                                child: Opacity(
                                  opacity: _current == true ? 0.3 : 1.0,
                                  child: Container(
                                    child: Text('Library',
                                        style:
                                            Theme.of(context).textTheme.body1),
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                  Container(
                    child: _currentChild(),
                  )
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openNewBookModal,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _currentChild() {
    if (_current == true) {
      return Expanded(flex: 1, child: Text(''));
    } else {
      return Expanded(
          flex: 1,
          child: FutureBuilder(
            future: booksList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox();
              } else {
                return SizedBox();
              }
            },
          ));
    }
  }
}
