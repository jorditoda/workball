import 'package:flutter/material.dart';
import 'package:workball/components/IMC.dart';
import 'package:workball/components/header.dart';
import 'package:workball/components/line_text.dart';
import 'package:workball/components/summary_row.dart';
import 'package:workball/components/weight_and_height.dart';
import 'package:workball/constants/constants.dart';

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    var width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Header(
                title: 'WB',
              ),
              LineText(
                Text(
                  "RESUMEN",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Impact",
                      color: Constants.oddYellow),
                ),
              ),
              SummaryRow("0", "256", 0),
              WeightAndHeight("87", "170"),
              IMC("25"),
            ],
          ),
        ),
      ),
    );
  }
}
