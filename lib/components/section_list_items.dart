import 'package:flutter/material.dart';

import '../models/exercise.dart';

class SectionList extends StatefulWidget {
  final List<Exercise> exercises;

  SectionList(this.exercises);

  @override
  _SectionListState createState() => _SectionListState(exercises);
}

class _SectionListState extends State<SectionList> {
  List<Exercise> exercises;

  _SectionListState(this.exercises);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 1000),
//      margin: EdgeInsets.only(top: 15.0),
//      height: exercises.length * 50.0,
//      height: 50,
//      width: MediaQuery.of(context).size.height - 20,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: exercises.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Row(
              children: <Widget>[
                if (exercises[index].image != null &&
                    exercises[index].image.isNotEmpty)
                  Image.asset(
                    exercises[index].image,
                    width: 150,
                  ),
//                Spacer(),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        exercises[index].title,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: "Montserrat-Light"),
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.visible,
                      ),
                      _getTimeOrReps(exercises[index]),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getTimeOrReps(Exercise ex) {
    if (ex.time == "0") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/rep.png",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              ex.reps + ' reps',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: "Montserrat-Light",
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/timer.png",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              ex.time,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: "Montserrat-Light",
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    }
  }
}
