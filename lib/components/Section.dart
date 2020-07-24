import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String text;
  final String image;
  final String title;

  Section(this.text, this.image, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.0),
      child: Column(
        children: <Widget>[
          SectionTitle((this.title != null) ? this.title : ''),
          Row(children: <Widget>[
            if (image != null && image.isNotEmpty)
              Image.asset(
                this.image,
                fit: BoxFit.cover,
              ),
            Text(text),
          ]),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String _text;

  SectionTitle(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          this._text,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
