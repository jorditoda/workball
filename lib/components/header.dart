import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final Widget rightSide;

  Header({this.title = "WB", this.rightSide});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(fontSize: 41, color: Colors.white),
      ),
    );
  }
}
