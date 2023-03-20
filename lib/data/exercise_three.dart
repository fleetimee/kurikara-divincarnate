import 'package:flutter/material.dart';

class ExerciseThree {
  final String courseName;
  final Color color;

  ExerciseThree({
    required this.courseName,
    required this.color,
  });
}

final List<ExerciseThree> allExerciseThree = [
  ExerciseThree(
    courseName: '1',
    color: const Color(0xFFECC055),
  ),
  ExerciseThree(
    courseName: 'Yī',
    color: const Color(0xFFBC56FB),
  ),
  ExerciseThree(
    courseName: '2',
    color: const Color(0xFF8EF50C),
  ),
  ExerciseThree(
    courseName: 'Sān',
    color: const Color(0xFFECC055),
  ),
  ExerciseThree(
    courseName: '3',
    color: const Color(0xFFBC56FB),
  ),
  ExerciseThree(
    courseName: 'Èr',
    color: const Color(0xFF8EF50C),
  ),
  ExerciseThree(
    courseName: '4',
    color: const Color(0xFF09A6FF),
  ),
  ExerciseThree(
    courseName: 'Sì',
    color: const Color(0xFF09A6FF),
  ),
];
