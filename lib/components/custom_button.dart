import 'package:flutter/material.dart';
import 'package:workball/constants/constants.dart';

class CustomButtonWidget extends StatefulWidget {
  final String title;
  final double width;
  final double height;
  final double marginTop;
  final double marginBottom;
  final double marginRight;
  final double marginLeft;
  final Color textColor;

  CustomButtonWidget(this.title,
      {this.width,
      this.height,
      this.marginTop = 25,
      this.marginBottom = 25,
      this.marginRight = 10,
      this.marginLeft = 10,
      this.textColor = Colors.white});

  @override
  _CustomButtonWidgetState createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double width = widget.width != null
        ? widget.width
        : MediaQuery.of(context).size.width * 0.8;
    double height = widget.height != null
        ? widget.height
        : MediaQuery.of(context).size.height * 0.1;

    return Container(
      margin: EdgeInsets.fromLTRB(widget.marginLeft, widget.marginTop,
          widget.marginRight, widget.marginBottom),
      decoration: BoxDecoration(
        color: Constants.grocXungu,
        borderRadius: BorderRadius.all(Radius.circular(33)),
      ),
      width: width,
      height: height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                height: 1.5,
                fontFamily: "Impact",
                color: widget.textColor),
          ),
        ),
      ),
    );
  }
}
