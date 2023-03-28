import 'package:flutter/material.dart';
import 'package:huixinapp/app/const/color.dart';

class ExerciseThreeData {
  final String courseName;
  Color color;
  final String correctAnswer;
  bool isAnsweredCorrectly;

  ExerciseThreeData({
    required this.courseName,
    required this.color,
    required this.correctAnswer,
    this.isAnsweredCorrectly = false,
  });
}

final List<ExerciseThreeData> allExerciseThree = [
  ExerciseThreeData(
    courseName: '1',
    color: AppColors.yellowColor2,
    correctAnswer: 'Sān',
  ),
  ExerciseThreeData(
    courseName: 'Yī',
    color: AppColors.purpleColor,
    correctAnswer: '3',
  ),
  ExerciseThreeData(
    courseName: '2',
    color: AppColors.greenColor1,
    correctAnswer: 'Èr',
  ),
  ExerciseThreeData(
    courseName: 'Sān',
    color: AppColors.yellowColor2,
    correctAnswer: '1',
  ),
  ExerciseThreeData(
    courseName: '3',
    color: AppColors.purpleColor,
    correctAnswer: 'Yī',
  ),
  ExerciseThreeData(
    courseName: 'Èr',
    color: AppColors.greenColor1,
    correctAnswer: '2',
  ),
  ExerciseThreeData(
    courseName: '4',
    color: AppColors.blueColor,
    correctAnswer: 'Sì',
  ),
  ExerciseThreeData(
    courseName: 'Sì',
    color: AppColors.blueColor,
    correctAnswer: '4',
  ),
];
