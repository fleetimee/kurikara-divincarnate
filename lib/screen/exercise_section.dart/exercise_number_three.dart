import 'package:flutter/material.dart';
import 'package:huixinapp/app/const/color.dart';
import 'package:huixinapp/data/exercise_three.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';
import 'package:huixinapp/widget/bottom_appbar_button.dart';

class ExerciseThree extends StatefulWidget {
  const ExerciseThree({super.key});

  @override
  State<ExerciseThree> createState() => _ExerciseThreeState();
}

class _ExerciseThreeState extends State<ExerciseThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Exercise',
        numberOfExercises: '3',
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 16),
              child: Text(
                'Cocokan angka berikut \ndengan benar',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: allExerciseThree.length,
                itemBuilder: (context, index) {
                  ExerciseThreeData currentExercise = allExerciseThree[index];

                  return GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          if (!currentExercise.isAnsweredCorrectly) {
                            currentExercise.isAnsweredCorrectly = true;

                            for (ExerciseThreeData exercise
                                in allExerciseThree) {
                              if (exercise.correctAnswer ==
                                  currentExercise.courseName) {
                                exercise.isAnsweredCorrectly = true;
                                break;
                              }
                            }
                          }
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: currentExercise.isAnsweredCorrectly
                            ? currentExercise.color
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        // border: currentExercise.isAnsweredCorrectly &&
                        //         currentExercise.correctAnswer !=
                        //             currentExercise.courseName
                        //     ? Border.all(
                        //         color: Colors.red,
                        //         width: 4,
                        //       )
                        //     : null,
                      ),
                      child: Center(
                        child: Text(
                          currentExercise.courseName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarButton(
        name: 'FINISH',
        color: AppColors.greenColor,
        onTap: () {},
      ),
    );
  }
}
