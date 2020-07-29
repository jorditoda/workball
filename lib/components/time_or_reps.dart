import 'package:flutter/material.dart';

import '../models/exercise.dart';

const repsAndTimeStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: "Impact",
  color: Colors.white,
);

class TimeOrReps extends StatefulWidget {
  final Exercise exercise;

  TimeOrReps(this.exercise);

  @override
  _TimeOrRepsState createState() => _TimeOrRepsState(exercise);
}

class _TimeOrRepsState extends State<TimeOrReps> {
  Exercise exercise;

  _TimeOrRepsState(this.exercise);

  @override
  Widget build(BuildContext context) {
    return _getTimeOrReps(widget.exercise);
  }

  Widget _getTimeOrReps(Exercise ex) {
    if (ex.time == "0") {
      return _getWidgetRepsAndTime("assets/images/rep.png", ex.reps + ' reps');
    } else {
      return _getWidgetRepsAndTime("assets/images/timer.png", ex.time);
    }
  }

  Widget _getWidgetRepsAndTime(String image, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            text,
            style: repsAndTimeStyle,
          ),
        ),
      ],
    );
  }
}
