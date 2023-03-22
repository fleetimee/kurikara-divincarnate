import 'package:flutter/material.dart';
import 'package:huixinapp/app/theme/theme_text.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';
import 'package:huixinapp/widget/bottom_appbar_note.dart';

class CourseDone extends StatelessWidget {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 20,
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
                    child: Text(
                      'Lesson Day 1',
                      style: ThemeText.textTheme6.copyWith(fontWeight: FontWeight.w500,),
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
                  Image.asset(
                    "assets/images/reading.png",
                    fit: BoxFit.fill,
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
                      Navigator.pushNamed(context, '/exercise_one');
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
                      Text(
                        'Remedial needed',
                        style: ThemeText.textTheme28 ,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBarWithNotes(),
    );
  }
}
