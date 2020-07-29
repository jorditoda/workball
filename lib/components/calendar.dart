import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/calendar_week.dart';
import 'package:workball/constants/constants.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CalendarWeek(
      height: 80,
      minDate: DateTime.now().add(
        Duration(days: _getDurationToCenter()),
      ),
      maxDate: DateTime.now().add(
        Duration(days: 365),
      ),
      dayOfWeekStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      dayOfWeekAlignment: FractionalOffset.bottomCenter,
      dateStyle:
          TextStyle(color: Constants.oddYellow, fontWeight: FontWeight.w400),
      dateAlignment: FractionalOffset.topCenter,
      todayDateStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      todayBackgroundColor: Constants.oddYellow,
      pressedDateBackgroundColor: Colors.transparent,
      pressedDateStyle:
          TextStyle(color: Constants.oddYellow, fontWeight: FontWeight.w400),
      dateBackgroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      dayOfWeek: ['L', 'M', 'X', 'J', 'V', 'S', 'D'],
      spaceBetweenLabelAndDate: 0,
      dayShapeBorder: CircleBorder(),
    );
  }

  int _getDurationToCenter() {
    return -(DateTime.now().weekday - 1);
  }
}
