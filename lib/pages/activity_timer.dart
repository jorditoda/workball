import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workball/components/time_or_reps.dart';

import '../components/custom_button.dart';
import '../components/header.dart';
import '../constants/constants.dart';
import '../models/exercise.dart';
import 'activity_finished.dart';

const TextStyle textOptionsStyle = TextStyle(
  fontSize: 17.0,
  fontFamily: "Impact",
  color: Colors.white,
);

class ActivityTimer extends StatefulWidget {
  @override
  _ActivityTimerState createState() => _ActivityTimerState();
}

class _ActivityTimerState extends State<ActivityTimer> {
  List<Exercise> exercises = Constants.eqExercises;
  Exercise actual;
  int index;
  bool last;
  bool rest;
  bool isPaused;

  Timer _timer;
  Timer _counter;
  int _start = 10;
  int workingTime = 0;

  @override
  void dispose() {
    _timer.cancel();
    _counter.cancel();
    super.dispose();
  }

  @override
  void initState() {
    index = 0;
    last = false;
    rest = true;
    isPaused = false;
    nextExercise();
    startCounter();
    startTimer(null);
    super.initState();
  }

  void nextExercise() {
    setState(() {
      if (index < exercises.length) {
        actual = exercises[index];
        index++;
      }
      if (index == exercises.length) last = true; //posar q ja ha acabat
    });
  }

  void prevExercise() {
    setState(() {
      if (index > 0) {
        index--;
        actual = exercises[index];
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
        centerTitle: true,
        title: Header(
          title: 'WB',
        ),
        actions: <Widget>[
          if (!rest && index != 0)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: _getPausePlayButton(),
            ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 270,
            child: Image.asset(
              actual.image,
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            height: size.height - 350,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _getTitleText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42,
                    color: Colors.white,
                    fontFamily: "Impact",
                  ),
                ),
                Text(
                  _getSubTitleText(),
                  style: TextStyle(
                    fontSize: 27.0,
                    fontFamily: "Impact",
                    color: Colors.white,
                  ),
                ),
                Text(
                  index.toString() +
                      ' ejercicio de ' +
                      exercises.length.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Montserrat-Light",
                    color: Colors.white,
                  ),
                ),
                TimeOrReps(actual),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    _getLeftButton(),
                    _getCentralRow(),
                    _getRightButton(),
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
      if (actual.time != "0") {
        return _getTimming();
      } else {
        return actual.reps.toString() + ' reps';
      }
    }
  }

  Widget _getCentralButton() {
    return Padding(
      padding: EdgeInsets.only(right: 15, left: 15),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              CustomButtonWidget.withWidget(
                _getCentralButtonWidget(),
                width: 125,
                height: 125,
                radius: 65,
                marginLeft: 0,
                marginRight: 0,
              ),
              if (rest)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'CUENTA ATRÁS',
                    style: textOptionsStyle,
                  ),
                ),
            ],
          ),
          Image.asset(
            "assets/images/rest_bar.png",
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  Widget _getCentralRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        if (!rest && index != 0)
          //previous exercise
          InkWell(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 40,
                ),
                Text(
                  "ANTERIOR\nEJERCICIO",
                  style: textOptionsStyle,
                ),
              ],
            ),
            onTap: () {
              print("prevExercise");
              _timer.cancel();
              prevExercise();
              setState(() {
                rest = true;
              });
              startTimer(null);
            },
          ),
        _getCentralButton(),
        if (!rest && index != exercises.length)
          //nextExercise
          InkWell(
            child: Row(
              children: <Widget>[
                Text(
                  "SIGUIENTE\nEJERCICIO",
                  style: textOptionsStyle,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 40,
                )
              ],
            ),
            onTap: () {
              print("nextExercise");
              nextExercise();
              setState(() {
                rest = true;
              });
              startTimer(null);
            },
          ),
      ],
    );
  }

  Widget _getCentralButtonWidget() {
    if (rest)
      return Text(
        _getTimeCentralButton(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 62.0,
          fontFamily: "Impact",
        ),
      );
    else {
      return InkWell(
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 62,
        ),
        onTap: () {
          print("nextExercise");
          nextExercise();
          setState(() {
            rest = true;
          });
          startTimer(null);
        },
      );
    }
  }

  String _getTimeCentralButton() {
    return _getTimming().split(":")[2];
  }

  Widget _getLeftButton() {
    if (rest) {
      //+10"
      return InkWell(
        child: CustomButtonWidget(
          "+10\"",
          width: 90,
          height: 60,
          marginRight: 0,
          marginLeft: 10,
        ),
        onTap: () {
          _timer.cancel();
          setState(() {
            _start += 10;
          });
          startTimer(_start);
        },
      );
    }
    return Container();
  }

  Widget _getRightButton() {
    if (rest) {
      //omitir
      return InkWell(
        child: CustomButtonWidget(
          "OMITIR",
          width: 90,
          height: 60,
          marginLeft: 0,
          marginRight: 10,
        ),
        onTap: () {
          _timer.cancel();
          setState(() {
            _start = 0;
            rest = false;
          });
          startTimer(null);
        },
      );
    }
    return Container();
  }

  String _getTimming() {
    Duration duration = Duration(seconds: _start);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  Widget _getPausePlayButton() {
    if (isPaused) {
      return InkWell(
        child: Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 35.0,
        ),
        onTap: () {
          setState(() {
            isPaused = !isPaused;
            unpauseTimer();
          });
        },
      );
    } else {
      return InkWell(
        child: Icon(
          Icons.pause,
          color: Colors.white,
          size: 35.0,
        ),
        onTap: () {
          setState(() {
            isPaused = !isPaused;
            pauseTimer();
          });
        },
      );
    }
  }

  void pauseTimer() {
    if (_timer != null) _timer.cancel();
  }

  void unpauseTimer() => startTimer(_start);

  void startTimer(int pauseTime) {
    if (pauseTime == null) {
      setState(() {
        if (rest) {
          _start = 10;
        } else {
          List<String> timef = actual.time.split(":");
          print("actual time:" + actual.time);
          int hour = int.parse(timef[0]);
          int minute = int.parse(timef[1]);
          int second = int.parse(timef[2]);
          _start = second + (60 * minute) + (3600 * hour);
        }
      });
    }
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            if (last) {
              _counter.cancel();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return ActivityFinished(workingTime, "VELOCIDAD EXTREMA I",
                    Constants.eqExercises.length);
              }));
            }
            print("rest " + rest.toString());
            print("last " + last.toString());
            print("actual " + actual.toString());
            if (!rest) {
              nextExercise();
            }
            rest = !rest;
            if (actual.time == "0") {
              showButtonNext();
            }
            if ((!last && actual.time != "0") || rest) {
              startTimer(null);
            }
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void startCounter() {
    const oneSec = const Duration(seconds: 1);
    _counter = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          workingTime++;
        },
      ),
    );
  }

  void showButtonNext() {}

  String _getSubTitleText() {
    if (index == 1 && rest) {
      return "PREPARADOS";
    } else if (!rest) {
      return actual.title;
    } else
      return "DESCANSO";
  }
}
