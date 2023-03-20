import 'package:flutter/material.dart';
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
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 16),
              child: Text(
                'Cocokan angka berikut \ndengan benar',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF000000),
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
                    return Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: allExerciseThree[index].color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          allExerciseThree[index].courseName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
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
        color: const Color(0xFF2AD352),
        onTap: () {},
      ),
    );
  }
}
