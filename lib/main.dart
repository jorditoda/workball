import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workball/tabs/tabs.dart';

void main() => runApp(MyApp());
const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String name;
  String position;
  DateTime today = DateTime.now();
  DateTime tomorrow = DateTime.parse("2020-09-01 14:00:00");

  Widget _body = Center(child: CircularProgressIndicator());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: primaryBlack,
        fontFamily: "Montserrat",
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: _body,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }

  @override
  void initState() {
    _readVars();
    super.initState();
  }

  void zeroDay() {
    if (today.isAfter(tomorrow)) {
      _body = Center(
        child: Text(
          "Paga la aplicación",
          style: TextStyle(fontSize: 50, fontFamily: "Impact-bold"),
        ),
      );
    }
  }

  _readVars() async {
    final prefs = await SharedPreferences.getInstance();
    String key = 'name';
    name = prefs.getString(key) ?? "";
    key = 'position';
    position = prefs.getString(key) ?? "";
    setState(() {
      if (position == null ||
          position.isEmpty ||
          name == null ||
          name.isEmpty) {
//      _body = LandingPage();
        _body = Tabs(position, name);
      } else {
        _body = Tabs(position, name);
      }
      zeroDay();
    });

    print('read name: $name');
    print('read position: $position');
  }
}
