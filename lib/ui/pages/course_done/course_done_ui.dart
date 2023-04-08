import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/ui/pages/exercise_section.dart/exercise_number_one_ui.dart';
import 'package:flutter_huixin_app/ui/pages/reading_section/reading_section_ui.dart';

import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/bottom_appbar_note.dart';


class CourseDone extends StatelessWidget {
  static const String routeName = '/course_done';
  const CourseDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCourse(
        title: 'Day 1',
        progression: '0/10',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 32,
                ),
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
                        "assets/images/chicken.png",
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height / 30,
                      right: MediaQuery.of(context).size.width / 17,
                      child: const Text(
                        'Lesson Day 1',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/crown.png",
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '70 / 100',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ReadingSection.routeName);
                      },
                      child: Image.asset(
                        "assets/images/reading.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/crown.png",
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '70 / 100',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ExerciseOne.routeName);
                      },
                      child: Image.asset(
                        "assets/images/exercise_remedial.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/remedial_warning.png",
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Remedial needed',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBarWithNotes(),
    );
  }
}
