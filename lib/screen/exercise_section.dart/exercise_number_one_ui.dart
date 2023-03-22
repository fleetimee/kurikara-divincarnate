import 'package:flutter/material.dart';
import 'package:huixinapp/app/const/color.dart';
import 'package:huixinapp/app/theme/theme_text.dart';
import 'package:huixinapp/data/question_data.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';
import 'package:huixinapp/widget/bottom_appbar_button.dart';

class ExerciseOne extends StatelessWidget {
  const ExerciseOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Exercise',
        numberOfExercises: '1',
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                '我 artinya…',
                style: ThemeText.textTheme27,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 32,
                        mainAxisSpacing: 32,
                      ),
                      itemCount: allQuestionData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: allQuestionData[index].isSelected
                                ? AppColors.greenColor
                                : AppColors.whiteColor3 ,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              allQuestionData[index].question,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: allQuestionData[index].isSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      })),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarButton(
        name: 'NEXT',
        color: AppColors.bottom,
        onTap: () {
          Navigator.pushNamed(context, '/exercise_two');
        },
      ),
    );
  }
}
