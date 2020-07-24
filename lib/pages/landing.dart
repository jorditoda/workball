import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workball/components/custom_button.dart';
import 'package:workball/components/input_label.dart';
import 'package:workball/components/line_text.dart';
import 'package:workball/constants/constants.dart';
import 'package:workball/tabs/tabs.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Widget _body;
  int state;
  final myController = TextEditingController();
  String name;
  String position = "";

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    state = 1;
    _body = landPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),
          image: AssetImage("assets/images/landing-image.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: _body,
    );
  }

  Widget landPage() {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _title(),
            _subtitle(),
            SizedBox(
              height: 70,
            ),
            Text(
              "Entrenamiento individual de fútbol.\n Mejora tus capacidades día a día.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.5,
                  fontFamily: "Montserrat-Medium"),
            ),
          ],
        ),
        _button(),
      ],
    );
  }

  Widget formPage() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Padding(
        padding: EdgeInsets.only(top: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _title(),
            _subtitle(),
            SizedBox(
              height: 70,
            ),
            LineText(InputLabel(text: "¿Cual es tu nombre?")),
            textFormWidget(),
            LineText(InputLabel(text: "¿Cual es tu posición?")),
            //TODO: picker
            Spacer(),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget textFormWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
      child: TextField(
        enableSuggestions: true,
        textCapitalization: TextCapitalization.sentences,
        controller: myController,
        onSubmitted: (value) {
          setState(() {
            name = value;
//            myController.clear();
          });
        },
        decoration: new InputDecoration(
          labelText: "Introduce tu nombre.",
          focusColor: Color.fromARGB(255, 69, 68, 68),
          fillColor: Color.fromARGB(255, 69, 68, 68),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(20.0),
            borderSide: new BorderSide(),
          ),
        ),
      ),
    );
  }

  Widget _button() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Center(
            child: CustomButtonWidget(
              state == 1 ? "EMPEZAR" : "CONTINUAR",
              textColor: Constants.greyText,
            ),
          ),
          onTap: () {
            setState(() {
              if (state == 1) {
                state++;
                _body = formPage();
              } else
//                if (name != null &&
//                  name.isNotEmpty &&
//                  position != null &&
//                  position.isNotEmpty)
              {
                saveAndNavigate();
              }
            });
          },
        ),
      ],
    );
  }

  Widget _title() {
    return Text(
      "WB",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 121, color: Colors.white, height: 1),
    );
  }

  Widget _subtitle() {
    return Text(
      "WORKBALL",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 20, color: Colors.white, height: 1.5, letterSpacing: 20),
    );
  }

  void saveAndNavigate() {
    _body = Stack(
      children: <Widget>[CircularProgressIndicator()],
    );
    _save();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Tabs(position, name);
    }));
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    String key = 'name';
    prefs.setString(key, name);
    key = 'position';
    prefs.setString(key, position);
    print('saved $name');
    print('saved $position');
  }
}
