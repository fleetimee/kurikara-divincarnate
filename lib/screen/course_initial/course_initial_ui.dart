import 'package:flutter/material.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';
import 'package:huixinapp/widget/bottom_appbar_note.dart';

class CourseInitial extends StatelessWidget {
  const CourseInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(title: 'Nanao Ise'),
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
                    bottom: 70,
                    left: 40,
                    child: Image.asset(
                      "assets/images/tree.png",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Positioned(
                    bottom: 35,
                    right: 40,
                    child: Text(
                      'Lesson Day 4',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 10,
                    child: Image.asset(
                      "assets/images/progress_bar.png",
                      height: 25,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Image.asset(
                "assets/images/reading.png",
                fit: BoxFit.fill,
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
