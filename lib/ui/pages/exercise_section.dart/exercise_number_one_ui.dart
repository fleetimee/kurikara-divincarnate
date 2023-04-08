import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/ui/pages/exercise_section.dart/exercise_number_two_ui.dart';

import '../../../common/constants/color.dart';
import '../../../cubit/entities/question_data.dart';
import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/bottom_appbar_button.dart';


class ExerciseOne extends StatefulWidget {
  static const String routeName = '/exercise_one';
  const ExerciseOne({super.key});

  @override
  State<ExerciseOne> createState() => _ExerciseOneState();
}

class _ExerciseOneState extends State<ExerciseOne> {
  @override
  void dispose() {
    super.dispose();
  }

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
            const Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                '我 artinya…',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                  itemCount: allQuestionData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          for (int i = 0; i < allQuestionData.length; i++) {
                            if (i == index) {
                              allQuestionData[i].isSelected = true;
                            } else {
                              allQuestionData[i].isSelected = false;
                            }
                          }
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: allQuestionData[index].isSelected
                              ? AppColors.greenColor
                              : AppColors.whiteColor3,
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
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarButton(
        name: 'NEXT',
        color: AppColors.bottom,
        onTap: () {
          Navigator.pushNamed(context, ExerciseTwo.routeName);
        },
      ),
    );
  }
}
