import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/header.dart';
import '../constants/constants.dart';
import '../models/exercise.dart';

class ActivityTimer extends StatefulWidget {
  @override
  _ActivityTimerState createState() => _ActivityTimerState();
}

class _ActivityTimerState extends State<ActivityTimer> {
  final String tag = 'imageHeader';
  List<Exercise> exercises = Constants.eqExercises;
  Exercise actual;
  int index;
  bool last;
  bool rest;

  Timer _timer;
  int _start = 10;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    index = 0;
    last = false;
    rest = true;
    nextExercise();
    startTimer();
    super.initState();
  }

  void nextExercise() {
    setState(() {
      if (index == exercises.length)
        last = true; //posar q ja ha acabat
      else {
        actual = exercises[index];
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.blackBackground,
      appBar: AppBar(
        backgroundColor: Constants.blackBackground,
        title: Header(
          title: 'WB',
        ),
        actions: <Widget>[
          if (!rest && index != 0)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.pause,
                color: Colors.white,
                size: 35.0,
              ),
            ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: tag,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.asset(
                actual.image,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        _getTitleText(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 42,
                            color: Colors.white,
                            fontFamily: "Impact"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        _getSubTitleText(),
                        style: TextStyle(
                          fontSize: 27.0,
                          fontFamily: "Impact",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        index.toString() +
                            ' ejercicio de ' +
                            exercises.length.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Montserrat-Light",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/timer.png",
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            actual.time,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "Montserrat-Light",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Spacer(),
                    CustomButtonWidget.withWidget(
                      _getCentralButton(),
                      width: 125,
                      height: 125,
                      radius: 65,
                    ),
//                    Container(
//                      width: size.width - 130.0,
//                      height: 55.0,
//                      decoration: BoxDecoration(
//                        color: Color.fromRGBO(232, 242, 248, 1.0),
//                        borderRadius: BorderRadius.circular(15.0),
//                      ),
//                      child: _getCentralButton(),
//                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getTitleText() {
    if (rest)
      return actual.title;
    else {
      return _getTimming();
    }
  }

  Widget _getCentralButton() {
    if (rest)
      return Text(
        _getTimeButton(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 62.0,
          fontFamily: "Impact",
        ),
      );
    else {
      return Icon(
        Icons.check,
        color: Colors.white,
        size: 62,
      );
    }
  }

  String _getTimming() {
    Duration duration = Duration(seconds: _start);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  String _getTimeButton() {
    return _getTimming().split(":")[2];
  }

  void startTimer() {
    if (rest) {
      _start = 10;
    } else {
      List<String> timef = actual.time.split(":");
      print(actual.time);
      int hour = int.parse(timef[0]);
      int minute = int.parse(timef[1]);
      int second = int.parse(timef[2]);
      _start = second + (60 * minute) + (3600 * hour);
    }
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            if (!rest) {
              nextExercise();
            }
            rest = !rest;
            if (!last && actual.time != "0") {
              startTimer();
            }
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  String _getSubTitleText() {
    if (index == 1 && rest) {
      return "PREPARADOS";
    } else if (!rest) {
      return actual.title;
    } else
      return "DESCANSO";
  }
}
