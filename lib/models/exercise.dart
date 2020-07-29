import 'package:flutter/foundation.dart';

class Exercise {
  final String title, time, difficult, image, reps;

  Exercise({
    @required this.title,
    @required this.time,
    @required this.reps,
    @required this.difficult,
    @required this.image,
  });

  @override
  String toString() {
    return 'Exercise{title: $title, time: $time, difficult: $difficult, image: $image, reps: $reps}';
  }
}
