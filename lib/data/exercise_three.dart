import 'package:flutter/material.dart';
import 'package:huixinapp/app/const/color.dart';

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
    color: AppColors.yellowColor2,
  ),
  ExerciseThree(
    courseName: 'Yī',
    color: AppColors.purpleColor,
  ),
  ExerciseThree(
    courseName: '2',
    color: AppColors.greenColor1 ,
  ),
  ExerciseThree(
    courseName: 'Sān',
    color: AppColors.yellowColor2,
  ),
  ExerciseThree(
    courseName: '3',
    color: AppColors.purpleColor,
  ),
  ExerciseThree(
    courseName: 'Èr',
    color: AppColors.greenColor1,
  ),
  ExerciseThree(
    courseName: '4',
    color: AppColors.blueColor,
  ),
  ExerciseThree(
    courseName: 'Sì',
    color: AppColors.blueColor,
  ),
];
