import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class IMC extends StatefulWidget {
  final String imc;

  IMC(this.imc);

  @override
  _IMCState createState() => _IMCState(imc);
}

class _IMCState extends State<IMC> {
  GlobalKey _imcKey = GlobalKey();
  String imc;

  _IMCState(this.imc);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 175,
      width: size.width,
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      color: Color.fromARGB(255, 41, 41, 41),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "I.M.C",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Impact",
              fontSize: 31,
            ),
          ),
          Container(
            height: _getImcHeight() + 54,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/imc.png",
                  fit: BoxFit.cover,
                  key: _imcKey,
                ),
                _imcLine(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imcLine() {
    double height = _getImcHeight();
    double padding = getFactor(double.parse(imc));

    return FAProgressBar(
      currentValue: int.parse(imc) - 15,
      displayText: null,
      animatedDuration: Duration(seconds: 1),
      maxValue: 25,
      borderRadius: 20,
      changeColorValue: 10,
      changeProgressColor: Colors.white,
    );

//    return Container(
//      alignment: Alignment.centerLeft,
////        padding: EdgeInsets.only(left: padding),
//      child: Column(
//        children: <Widget>[
//          Text(
//            imc,
//            style: TextStyle(
//              fontFamily: "Impact",
//              fontSize: 16,
//              color: Colors.white,
//            ),
//          ),
//          Container(
//            margin: EdgeInsets.only(top: 10),
//            height: height - 25,
//            width: 2.0,
//            color: Colors.white,
//          ),
//        ],
//      ),
//    );
  }

  double getFactor(double imc) {
    double width = _getImcWidth();

//    y = w/35x - 15(w/35)
    double m = (width / 25);
    double padding = (m * imc) - (15 * m);
    print("padding: " + padding.toString() + "\twidth: " + width.toString());
    return padding;
  }

  double _getImcWidth() {
    if (_imcKey != null && _imcKey.currentContext != null) {
      final RenderBox renderBoxRed = _imcKey.currentContext.findRenderObject();
      final sizeImc = renderBoxRed.size;
      print("SIZE of imc: $sizeImc");

      return sizeImc.width - 20;
    } else
      return 16;
//      return context.size.width - 40;
  }

  double _getImcHeight() {
    if (_imcKey != null && _imcKey.currentContext != null) {
      final RenderBox renderBoxRed = _imcKey.currentContext.findRenderObject();
      final sizeImc = renderBoxRed.size;
      return sizeImc.height;
    } else
      return 70;
  }
}
