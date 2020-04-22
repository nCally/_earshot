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
              body1: TextStyle(fontSize: 18, color: const Color(0XFFCDBFBC)),
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
  int _currentTab = 0;

  void _switchTabs() {
    if (_currentTab == 0) {
      _currentTab = 1;
    } else {
      _currentTab = 0;
    }

    setState(() {
      _currentTab = _currentTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'What nostrud et.',
                style: TextStyle(fontSize: 18),
              )
            ],
          )
        ],
      ),
    );
  }
}
