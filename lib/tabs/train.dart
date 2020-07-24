import 'package:flutter/material.dart';
import 'package:workball/components/custom_button.dart';
import 'package:workball/components/header.dart';
import 'package:workball/components/hello_name.dart';
import 'package:workball/components/image_card_with_basic_footer.dart';
import 'package:workball/components/section.dart';
import 'package:workball/constants/constants.dart';
import 'package:workball/models/exercise.dart';
import 'package:workball/pages/activity_detail.dart';

class Programs extends StatelessWidget {
  String name;

  Programs(this.name);

  final List<Exercise> exercises = [
    Exercise(
      image: 'assets/images/image001.jpg',
      title: 'Easy Start',
      time: '5 min',
      difficult: 'Low',
    ),
    Exercise(
      image: 'assets/images/image002.jpg',
      title: 'Medium Start',
      time: '10 min',
      difficult: 'Medium',
    ),
    Exercise(
      image: 'assets/images/image003.jpg',
      title: 'Pro Start',
      time: '25 min',
      difficult: 'High',
    )
  ];

  List<Widget> generateList(BuildContext context) {
    List<Widget> list = [];
    int count = 0;
    exercises.forEach((exercise) {
      Widget element = Container(
        margin: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          child: ImageCardWithBasicFooter(
            exercise: exercise,
            tag: 'imageHeader$count',
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return ActivityDetail(
                    exercise: exercise,
                    tag: 'imageHeader$count',
                  );
                },
              ),
            );
          },
        ),
      );
      list.add(element);
      count++;
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.blackBackground,
      appBar: AppBar(
        backgroundColor: Constants.blackBackground,
        title: Header(
          title: 'WB',
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            HelloName(name),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView(
                children: <Widget>[
                  Section(
                    "Molt de text",
                    "assets/images/vel_1.png",
                    'EQUILIBRADO',
                  ),
                  Section(
                    "Molt de text",
                    "assets/images/vel_1.png",
                    'VELOCIDAD EXTREMA I',
                  ),
                  Section(
                    "Molt de text",
                    "assets/images/vel_2.png",
                    'VELOCIDAD EXTREMA II',
                  ),
                  Section(
                    "Molt de text",
                    "assets/images/vel_3.png",
                    'VELOCIDAD EXTREMA III',
                  ),
                ],
              ),
            ),

//            Spacer(),
            _button(context),
          ],
        ),
      ),
    );
  }

  Widget _button(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CustomButtonWidget(
          "VAMOS!",
          textColor: Colors.white,
        ),
      ),
      onTap: () {
        navigate(context);
      },
    );
  }

  void navigate(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Programs(name);
    }));
  }
}
