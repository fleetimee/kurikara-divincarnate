import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/home/active_student/active_student_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/daily_activity/daily_activity_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/xp/xp_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/get_active_student_response_model.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/constants/color.dart';
import '../../../cubit/entities/active_students.dart';
import '../../../cubit/entities/home_course.dart';
import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/navigator_style.dart';
import '../../widgets/pageroute.dart';
import '../course_selector/course_selector_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataUser? user;

  @override
  void initState() {
    super.initState();

    _getUser();
  }

  void _getUser() async {
    user = await AppSecureStorage.getUser();

    setState(() {
      context.read<XpCubit>().getXp(user?.userId ?? '');
      context.read<DailyActivityCubit>().getDailyActivity(user?.userId ?? '');
      context.read<ActiveStudentCubit>().getActiveStudent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBarHome(
        title: user?.fullName ?? 'Loading...',
        xp: context.select(
          (XpCubit xpCubit) => xpCubit.state.maybeMap(
            orElse: () => '..',
            loaded: (state) => state.data.data?.first.jmlXp.toString(),
          ),
        ),
        dailyActivity: context.select((DailyActivityCubit dailyActivityCubit) =>
            dailyActivityCubit.state.maybeMap(
              orElse: () => '..',
              loaded: (state) => state.data.data?.first.jmlDaily.toString(),
            )),
      ),
      body: const HomeItems(),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(top: 20),
        child: NavigatorBar(
          currentIndex: 0,
        ),
      ),
    );
  }
}

class HomeItems extends StatelessWidget {
  const HomeItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ActiveStudentCubit, ActiveStudentState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: 330,
                      height: 100,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 8),
                        itemCount: studentsData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return state.when(
                            initial: () {
                              return const AvatarLoading();
                            },
                            loading: () {
                              return const AvatarLoading();
                            },
                            loaded: (data) {
                              return AvatarLoader(
                                data: data,
                                index: index,
                              );
                            },
                            error: (message) {
                              return Text(message);
                            },
                          );
                        },
                      ),
                    );
                  },
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
                        ? Navigator.push(context,
                            FadePageRoute(builder: (context) {
                            return const CourseSelector();
                          }))
                        : null;
                  },
                  child: Card(
                    color: AppColors.whiteColor,
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
                                    color: AppColors.bottom,
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
          )
        ],
      ),
    );
  }
}

class AvatarLoading extends StatelessWidget {
  const AvatarLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: CircleAvatar(
            radius: 30,
            child: RandomAvatar('fleetime'),
          ),
        ),
      ],
    );
  }
}

class AvatarLoader extends StatelessWidget {
  final int index;
  final GetActiveStudentResponseModel data;

  const AvatarLoader({
    super.key,
    required this.index,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: RandomAvatar(
            data.data![index].fullName ?? '..',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          data.data![index].fullName ?? '..',
        ),
      ],
    );
  }
}
