import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_group_materi/master_group_materi_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';

import '../../../common/constants/color.dart';
import '../../../cubit/entities/course_selector.dart';
import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/bottom_appbar_note.dart';

class CourseSelector extends StatefulWidget {
  const CourseSelector({super.key});

  @override
  State<CourseSelector> createState() => _CourseSelectorState();
}

class _CourseSelectorState extends State<CourseSelector> {
  Map? args;
  DataUser? user;

  Future<void> _getArgs() async {
    args = (await Future.delayed(Duration.zero, () {
      return ModalRoute.of(context)?.settings.arguments as Map?;
    }))!;
  }

  @override
  void initState() {
    super.initState();

    _getUser();
  }

  void _getUser() async {
    _getArgs();
    user = await AppSecureStorage.getUser();

    setState(() {
      context.read<MasterGroupMateriCubit>().getMasterGroupMateri(
            user?.userId ?? '',
            args?['level_id'] ?? '',
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Get arguments from previous page

    return Scaffold(
      appBar: AppBarCourse(
        title: context.select(
          (MasterGroupMateriCubit masterMateriCubit) =>
              masterMateriCubit.state.maybeMap(
            orElse: () => '..',
            loaded: (state) => state.data.data?.first.name ?? '..',
          ),
        ),
        progression: '5/12',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: allCourseSelector.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      allCourseSelector[index].routeName != ''
                          ? Navigator.pushNamed(
                              context, allCourseSelector[index].routeName)
                          : null;
                    },
                    child: Card(
                      color: AppColors.whiteColor,
                      child: Column(
                        children: [
                          Expanded(
                            child: Card(
                              child: allCourseSelector[index].isUnlocked == true
                                  ? Container(
                                      color: AppColors.bottom,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                allCourseSelector[index].day,
                                                style: const TextStyle(
                                                  color: AppColors.whiteColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Image.asset(
                                                allCourseSelector[index]
                                                    .logoUrl,
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
                                      color: AppColors.whiteColor2,
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBarWithNotes(),
    );
  }
}
