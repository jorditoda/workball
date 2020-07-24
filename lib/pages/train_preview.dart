import 'package:flutter/material.dart';
import 'package:workball/components/Header.dart';
import 'package:workball/components/calendar.dart';
import 'package:workball/components/custom_button.dart';
import 'package:workball/components/line_text.dart';
import 'package:workball/constants/constants.dart';
import 'package:workball/tabs/train.dart';

class TrainPreview extends StatefulWidget {
  final String position;
  final String name;

  TrainPreview(this.position, this.name);

  @override
  _TrainPreviewState createState() => _TrainPreviewState(position);
}

class _TrainPreviewState extends State<TrainPreview> {
  String position;
  String _radioValue;

  _TrainPreviewState(this.position);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 21.0),
      child: Scaffold(
        backgroundColor: Constants.blackBackground,
        body: Column(
          children: <Widget>[
            Header(
              title: 'WB',
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
              child: Calendar(),
            ),
            textLabel("POSICIÓN"),
            Text(
//              position,
              "position",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: "Montserrat-Light"),
            ),
            Spacer(),
            LineText(textLabel("Donde vas a entrenar?")),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Center(
                child: ListView(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.15, top: 15),
                  children: <Widget>[
                    radioButtonElement("Campo de fútbol", "camp"),
                    radioButtonElement("Gimnasio", "gym"),
                    radioButtonElement("Domicilio", "home"),
                  ],
                ),
              ),
            ),
//            Spacer(),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget radioButtonElement(String title, String value) {
    return RadioListTile(
      value: value,
      dense: true,
      activeColor: Constants.grocXungu,
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "Montserrat-light", fontSize: 18, color: Colors.white),
      ),
      groupValue: _radioValue,
      onChanged: _handleRadioValueChange,
    );
  }

  void _handleRadioValueChange(String value) {
    setState(() {
      _radioValue = value;
    });
  }

  Widget _button() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Center(
        child: CustomButtonWidget(
          "INICIAR ENTRENAMIENTO",
          textColor: Colors.white,
        ),
      ),
      onTap: () {
        setState(() {
          saveAndNavigate();
        });
      },
    );
  }

  Widget textLabel(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 27, color: Colors.white, fontFamily: "Impact"),
    );
  }

  void saveAndNavigate() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Programs(widget.name);
    }));
  }
}
