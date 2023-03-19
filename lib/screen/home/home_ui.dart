import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:huixinapp/data/active_students.dart';
import 'package:huixinapp/data/home_course.dart';
import 'package:huixinapp/widget/navigator_style.dart';

import '../../widget/AppBar/appbar_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(
        title: "Nanao Ise",
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Active Students',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 350,
                  height: 100,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    itemCount: studentsData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage(studentsData[index].imageUrl),
                          ),
                          const SizedBox(height: 8),
                          Text(studentsData[index].studentName),
                        ],
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/more_students.png",
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: allHomeCourse.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      allHomeCourse[index].isUnlocked == true
                          ? Navigator.pushNamed(
                              context, allHomeCourse[index].routeName)
                          : null;
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/images/crown.png",
                                  height: 10,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '${allHomeCourse[index].currentCourse}/${allHomeCourse[index].totalCourse}',
                                  style: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: allHomeCourse[index].isUnlocked == true
                                  ? Container(
                                      color: const Color(0xFFFF4546),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                allHomeCourse[index].courseName,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Image.asset(
                                                allHomeCourse[index].logoUrl,
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
                                blendMode: BlendMode.srcOver,
                                color: Colors.white12)
                            .move(
                                begin: const Offset(-16, 0),
                                curve: Curves.easeOutQuad),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const NavigatorBar(),
    );
  }
}
