import 'package:flutter/material.dart';
import 'package:huixinapp/app/theme/theme_text.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';
import 'package:huixinapp/widget/bottom_appbar_note.dart';

class CourseInitial extends StatelessWidget {
  const CourseInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCourse(
        title: 'Day 4',
        progression: '0/14',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    "assets/images/container.png",
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height / 15,
                    left: MediaQuery.of(context).size.width / 12,
                    child: Image.asset(
                      "assets/images/tree.png",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height / 30,
                    right: MediaQuery.of(context).size.width / 17,
                    child: Text(
                      'Lesson Day 4',
                      style: ThemeText.textTheme6.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height / 70,
                    right: MediaQuery.of(context).size.width / 30,
                    child: Image.asset(
                      "assets/images/progress_bar.png",
                      height: 25,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/reading_section');
                },
                child: Image.asset(
                  "assets/images/reading.png",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                "assets/images/exercise.png",
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBarWithNotes(),
    );
  }
}
