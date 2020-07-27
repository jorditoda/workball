import 'package:flutter/material.dart';
import 'package:workball/components/custom_button.dart';
import 'package:workball/components/header.dart';
import 'package:workball/components/hello_name.dart';
import 'package:workball/components/section.dart';
import 'package:workball/constants/constants.dart';

import '../constants/constants.dart';
import '../models/exercise.dart';
import '../pages/activity_detail.dart';

class Programs extends StatefulWidget {
  final String name;

  Programs(this.name);

  @override
  _ProgramsState createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  bool showList;

  @override
  void initState() {
    showList = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.blackBackground,
      appBar: AppBar(
        backgroundColor: Constants.blackBackground,
        title: Header(
          title: 'WB',
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            HelloName(widget.name),
            Container(
              height: MediaQuery.of(context).size.height - 220,
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  Section(
                    'EQUILIBRADO',
                    "Entrenamiento enfocados en la aceleración y velocidad. "
                        "Perfecto para comenzar a fortificar las piernas.",
                    "assets/images/vel_1.png",
                    Constants.eqExercises,
                  ),
                  Section(
                      'VELOCIDAD EXTREMA I',
                      "Entrenamiento enfocados en la aceleración y velocidad. "
                          "Perfecto para comenzar a fortificar las piernas.",
                      "assets/images/vel_1.png",
                      null),
                  Section(
                      'VELOCIDAD EXTREMA II',
                      "Entrenamiento enfocado en la primera zancada,  iniciarás"
                          "un arranque potente. ",
                      "assets/images/vel_2.png",
                      null),
                  Section(
                      'VELOCIDAD EXTREMA III',
                      "Entrenamiento para mantener una alta velocidad  durante "
                          "la carrera.",
                      "assets/images/vel_3.png",
                      null),
                ],
              ),
            ),
            Spacer(),
            _button(context),
          ],
        ),
      ),
    );
  }

  Widget _button(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CustomButtonWidget(
          "VAMOS!",
          textColor: Colors.white,
        ),
      ),
      onTap: () {
        navigate(context);
      },
    );
  }

  void navigate(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ActivityDetail(
          exercise: new Exercise(
            image: 'assets/images/image003.jpg',
            title: 'Pro Start',
            time: '25 min',
            reps: '0',
            difficult: "_radioValue",
          ),
          tag: 'imageHeader1');
    }));
  }
}
