import 'package:flutter/material.dart';
import 'package:workball/constants/constants.dart';

class SummaryRow extends StatelessWidget {
  final String nExercises;
  final String kCal;
  final int time;

  SummaryRow(this.nExercises, this.kCal, this.time);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 130,
      width: size.width,
      padding: EdgeInsets.only(left: 20, right: 20),
      color: Color.fromARGB(255, 41, 41, 41),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _getColumns("Nº EJERCICIOS", nExercises),
          VerticalDivider(
            color: Constants.blackBackground,
            thickness: 2,
          ),
          _getColumns("KCAL", kCal),
          VerticalDivider(
            color: Constants.blackBackground,
            thickness: 2,
          ),
          _getColumns("TIEMPO", _getTime()),
        ],
      ),
    );
  }

  Widget _getColumns(String title, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: "Impact",
            color: Constants.oddYellow,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 33.0,
            fontFamily: "Impact",
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  String _getTime() {
    if (time > 60) {
      Duration dur = Duration(seconds: time);
      return (dur.inMinutes).toString() + "min";
    } else {
      return (time).toString() + "sec";
    }
  }
}
