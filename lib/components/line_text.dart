import 'package:flutter/material.dart';
import 'package:workball/constants/constants.dart';

class LineText extends StatelessWidget {
  final Widget text;

  LineText(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: Divider(
              color: Constants.oddYellow,
              height: 36,
            )),
      ),
      text,
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Divider(
              color: Constants.oddYellow,
              height: 36,
            )),
      ),
    ]);
  }
}
