import 'package:flutter/material.dart';
import 'package:huixinapp/app/const/color.dart';
import 'package:huixinapp/app/theme/theme_text.dart';
import 'package:huixinapp/data/exercise_three.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';
import 'package:huixinapp/widget/bottom_appbar_button.dart';

class ExerciseThree extends StatelessWidget {
  const ExerciseThree({super.key});

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
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16),
              child: Text(
                'Cocokan angka berikut \ndengan benar',
                style: ThemeText.textTheme25,
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
                    return Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: allExerciseThree[index].color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          allExerciseThree[index].courseName,
                          style: ThemeText.textTheme26,
                        ),
                      ),
                    );
                  }),
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
