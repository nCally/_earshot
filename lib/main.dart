import 'package:flutter/material.dart';

void main() => runApp(EarshotApp());

class EarshotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EarShot',
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: const Color(0XFF2B3B46),
          accentColor: const Color(0XFFCE9073),
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

  void setCurrent() {
    setState(() {
      _current = !_current;
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
                            onTap: () {
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
        onPressed: () {
          setState(() {
            _current = !_current;
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _currentChild() {
    if (_current == true) {
      return Expanded(
          flex: 1,
          child: ListView(
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "First",
                        style: Theme.of(context).textTheme.body2,
                      )
                    ],
                  )
                ],
              )
            ],
          ));
    } else {
      return Expanded(
        flex: 1,
        child: ListView(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                Text(
                  "Seconds",
                  style: Theme.of(context).textTheme.body2,
                )
              ],
            )
          ],
        ),
      );
    }
  }
}
