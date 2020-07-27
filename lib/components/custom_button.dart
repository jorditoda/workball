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
  final Widget widget;
  final double radius;

  CustomButtonWidget(this.title,
      {this.width,
      this.height,
      this.marginTop = 0,
      this.marginBottom = 10,
      this.marginRight = 40,
      this.marginLeft = 40,
      this.textColor = Colors.white,
      this.radius = 33,
      this.widget});

  CustomButtonWidget.withWidget(this.widget,
      {this.width,
      this.height,
      this.marginTop = 0,
      this.marginBottom = 10,
      this.marginRight = 40,
      this.marginLeft = 40,
      this.textColor = Colors.white,
      this.radius = 33,
      this.title});

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
        color: Constants.oddYellow,
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      ),
//      foregroundDecoration: BoxDecoration(color: Colors.transparent),
      width: width,
      height: height,
//      color: Colors.transparent,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: widget.widget == null
              ? Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      height: 1.5,
                      fontFamily: "Impact",
                      color: widget.textColor),
                )
              : widget.widget,
        ),
      ),
    );
  }
}
