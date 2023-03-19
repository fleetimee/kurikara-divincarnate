import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:huixinapp/data/course_selector.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';

class CourseSelector extends StatelessWidget {
  const CourseSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(
        title: 'Nanao Ise',
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Expanded(
          child: GridView.builder(
            itemCount: allCourseSelector.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                // onTap: () {
                //   allCourseSelector[index].isUnlocked == true
                //       ? Navigator.pushNamed(
                //           context, allCourseSelector[index].route)
                //       : null;
                // },
                child: Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Card(
                          child: allCourseSelector[index].isUnlocked == true
                              ? Container(
                                  color: const Color(0xFFFF4546),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            allCourseSelector[index].day,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Image.asset(
                                            allCourseSelector[index].logoUrl,
                                            height: 50,
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(height: 8),
                                          Image.asset(
                                            "assets/images/progress_bar.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  color: const Color(0xFFD8D8D8),
                                  child: Center(
                                    child: Image.asset(
                                      "assets/images/lock.png",
                                      height: 30,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ]
                        .animate(interval: 100.ms)
                        .fadeIn(duration: 200.ms, delay: 400.ms)
                        .shimmer(
                            blendMode: BlendMode.srcOver, color: Colors.white12)
                        .move(
                            begin: const Offset(-16, 0),
                            curve: Curves.easeOutQuad),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
