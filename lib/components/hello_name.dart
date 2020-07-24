import 'package:flutter/material.dart';
import 'package:workball/constants/constants.dart';

import 'line_text.dart';

class HelloName extends StatelessWidget {
  final String name;

  HelloName(this.name);

  @override
  Widget build(BuildContext context) {
    return LineText(Row(
      children: <Widget>[
        Text(
          "Hola,",
          style: TextStyle(
              fontSize: 24,
              fontFamily: "Montserrat-light",
              color: Colors.white),
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: 24, fontFamily: "Impact", color: Constants.grocXungu),
        ),
      ],
    ));
  }
}
