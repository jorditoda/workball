import 'package:flutter/material.dart';
import 'package:workball/components/section_list_items.dart';

import '../models/exercise.dart';

class Section extends StatefulWidget {
  final String text;
  final String image;
  final String title;
  final List<Exercise> exercises;

  Section(this.title, this.text, this.image, this.exercises);

  @override
  _SectionState createState() => _SectionState(exercises);
}

class _SectionState extends State<Section> {
  bool expanded;
  bool showList;
  List<Exercise> exercises;

  _SectionState(this.exercises);

  @override
  void initState() {
    (widget.title == "EQUILIBRADO") ? expanded = true : expanded = false;
    showList = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Column(
        children: <Widget>[
          InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: SectionTitle(
                  (this.widget.title != null) ? this.widget.title : '',
                  expanded),
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              }),
          SizedBox(
            height: 5,
          ),
          if (expanded)
            InkWell(
              child: _getBody(),
              onTap: () {
                setState(() {
                  showList = !showList;
                });
              },
            ),
          if (expanded && showList && exercises != null) SectionList(exercises),
        ],
      ),
    );
  }

  Widget _getBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Row(
        children: <Widget>[
          if (widget.image != null && widget.image.isNotEmpty)
            Image.asset(
              this.widget.image,
              fit: BoxFit.cover,
            ),
//                  Spacer(),
          Expanded(
            child: Text(
              widget.text,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: "Montserrat-Light"),
              textAlign: TextAlign.right,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String _text;
  final bool expanded;

  SectionTitle(this._text, this.expanded);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          children: <Widget>[
            if (this._text == "EQUILIBRADO")
              Image.asset(
                "assets/images/desbloqueado.png",
                fit: BoxFit.cover,
              )
            else
              Image.asset(
                "assets/images/bloqueado.png",
                fit: BoxFit.cover,
              ),
            SizedBox(
              width: 8,
            ),
            Text(
              this._text,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            Spacer(),
            (expanded)
                ? Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }
}
