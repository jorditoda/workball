import 'package:flutter/material.dart';
import 'package:workball/components/time_or_reps.dart';

import '../models/exercise.dart';

const repsAndTimeStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: "Impact",
  color: Colors.white,
);

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
                      TimeOrReps(exercises[index]),
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
}
