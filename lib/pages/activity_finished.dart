import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:workball/components/line_text.dart';
import 'package:workball/components/summary_row.dart';
import 'package:workball/tabs/tabs.dart';

import '../components/custom_button.dart';
import '../components/header.dart';
import '../constants/constants.dart';

class ActivityFinished extends StatefulWidget {
  final int workingTime;
  final String difficulty;
  final int nExercises;

  ActivityFinished(this.workingTime, this.difficulty, this.nExercises);

  @override
  _ActivityFinishedState createState() => _ActivityFinishedState(
      this.workingTime, this.difficulty, this.nExercises);
}

class _ActivityFinishedState extends State<ActivityFinished> {
  int workingTime;
  int nExercises;
  String difficulty;
  File _imageFile;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  _ActivityFinishedState(this.workingTime, this.difficulty, this.nExercises);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double space = (MediaQuery.of(context).size.height - 660);

    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        backgroundColor: Constants.blackBackground,
        appBar: AppBar(
          backgroundColor: Constants.blackBackground,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Header(
            title: 'WB',
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.share, color: Colors.white),
                onPressed: shareAndScreenshot,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            LineText(
              Text(
                "RESUMEN",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Impact",
                    color: Constants.oddYellow),
              ),
            ),
            Padding(
//            padding: const EdgeInsets.only(top: 30, bottom: 30),
              padding: const EdgeInsets.only(top: 0),
              child: Text(
                difficulty,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  color: Colors.white,
                  fontFamily: "Impact",
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Image.asset(
                "assets/images/champion.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            SummaryRow(nExercises.toString(), "256", workingTime),
            _getCentralButton(),
            SizedBox(height: space > 10 ? 10 : space),
          ],
        ),
        bottomNavigationBar: GestureDetector(
          child: CustomButtonWidget(
            'FINALIZAR ENTRENAMIENTO',
            textColor: Colors.white,
          ),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Tabs("", "")),
                (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }

//
  void shareAndScreenshot() async {
    screenshotController.capture().then((File image) {
      //Capture Done
      setState(() {
        _imageFile = image;

        Share.file('Entrenamiento', '${DateTime.now()}.png',
            _imageFile.readAsBytesSync(), 'image/png');
      });
    }).catchError((onError) {
      print(onError);
    });

  }

  Widget _getCentralButton() {
    //TODO: restart train
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            CustomButtonWidget.withWidget(
              _getCentralButtonWidget(),
              width: 140,
              height: 130,
              radius: 100,
              marginRight: 0,
              marginLeft: 0,
              marginTop: 10,
            ),
          ],
        ),
        Image.asset(
          "assets/images/champion_arrow.png",
        ),
      ],
    );
  }

  Widget _getCentralButtonWidget() {
    return Text(
      "¿REPETIMOS?",
      style: TextStyle(
        color: Colors.white,
        fontSize: 19.0,
        fontFamily: "Impact",
      ),
    );
  }
}
