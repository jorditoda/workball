import 'package:flutter/material.dart';
import 'package:workball/constants/constants.dart';

class WeightAndHeight extends StatelessWidget {
  final String weight;
  final String height;

  WeightAndHeight(this.weight, this.height);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: size.width,
      padding: EdgeInsets.only(left: 20, right: 20),
      color: Constants.blackBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _getColumns(weight, height),
          _getDay(),
        ],
      ),
    );
  }

  Widget _getColumns(String weight, String height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _getInfo("PESO (Kg):", weight),
        _getInfo("ALTURA (cm):", height),
      ],
    );
  }

  Widget _getInfo(String title, String text) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: "Impact",
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          width: 70,
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 69, 68, 68),
            borderRadius: BorderRadius.all(
              Radius.circular(9.0),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 19.0,
              fontFamily: "Impact",
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getDay() {
    DateTime today = DateTime.now();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          today.day.toString(),
          style: TextStyle(
              color: Colors.white, fontFamily: "Impact", fontSize: 91),
        ),
        Text(
          Constants.month[today.month],
          style: TextStyle(
              color: Colors.white, fontFamily: "Impact", fontSize: 20),
        )
      ],
    );
  }
}
