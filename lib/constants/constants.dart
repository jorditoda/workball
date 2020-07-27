import 'package:flutter/material.dart';

import '../models/exercise.dart';

class Constants {
  static const Color oddYellow = Color.fromARGB(255, 219, 212, 19);
  static const Color blackBackground = Color.fromARGB(255, 49, 49, 49);
  static const Color greyText = Color.fromARGB(255, 85, 85, 85);
  static Exercise eq1 = Exercise(
      title: "CORRER DURANTE AÑOS",
      time: "00:00:20",
      reps: "0",
      difficult: "eq",
      image: 'assets/images/image007.jpg');

  static Exercise eq2 = Exercise(
      title: "RODILLAS PARA ATRAS",
      time: "0",
      reps: "3",
      difficult: "eq",
      image: 'assets/images/image001.jpg');

  static Exercise eq3 = Exercise(
      title: "FLEXIONES SIN BRAZOS",
      time: "0",
      reps: "3",
      difficult: "eq",
      image: 'assets/images/image002.jpg');

  static List<Exercise> eqExercises = [eq1, eq2, eq3];
}
