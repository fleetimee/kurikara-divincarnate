import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/home/active_student/active_student_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/daily_activity/daily_activity_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/xp/xp_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_level/master_level_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/get_active_student_response_model.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/constants/color.dart';
import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/navigator_style.dart';

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
      context.read<MasterLevelCubit>().getMasterLevel(user?.userId ?? '');
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
        dailyActivity: context.select(
          (DailyActivityCubit dailyActivityCubit) =>
              dailyActivityCubit.state.maybeMap(
            orElse: () => '..',
            loaded: (state) => state.data.data?.first.jmlDaily.toString(),
          ),
        ),
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
                        itemCount: state.maybeMap(
                          orElse: () => 6,
                          loaded: (state) => state.data.data?.length ?? 0,
                        ),
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
            child: BlocBuilder<MasterLevelCubit, MasterLevelState>(
              builder: (context, state) {
                return GridView.builder(
                  itemCount: state.maybeMap(
                    orElse: () => 12,
                    loaded: (state) => state.data.data?.length ?? 0,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return state.when(
                      initial: () {
                        return null;
                      },
                      loading: () {
                        return const CircularProgressIndicator();
                      },
                      loaded: (data) {
                        return TileMasterLevel(
                          index: index,
                          levelName: data.data![index].name ?? '',
                          levelImageUrl: data.data![index].imgUrl ?? '',
                          levelImage: data.data![index].imgFile ?? '',
                          state: state,
                        );
                      },
                      error: (message) {
                        return Text(message);
                      },
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class TileMasterLevel extends StatelessWidget {
  final int index;
  final String levelName;
  final String levelImageUrl;
  final String levelImage;
  final MasterLevelState state;

  const TileMasterLevel({
    super.key,
    required this.index,
    required this.levelName,
    required this.levelImage,
    required this.levelImageUrl,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // allHomeCourse[index].isUnlocked == true
        //     ? Navigator.push(
        //         context,
        //         FadePageRoute(
        //           builder: (context) {
        //             return const CourseSelector();
        //           },
        //         ),
        //       )
        //     : null;
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
                  const Text(
                    '1/2',
                    style: TextStyle(
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: state.maybeMap(
                  orElse: () => null,
                  loaded: (state) {
                    if (index == 0) {
                      return Container(
                        color: AppColors.bottom,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  levelName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Image.network(
                                  'https://huixin.id/assets/level/$levelImage',
                                  height: 80,
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
                      );
                    } else {
                      return (state.data.data![index].reportReading!
                                  .isNotEmpty ||
                              state
                                  .data.data![index].reportSpeaking!.isNotEmpty)
                          ? Container(
                              color: AppColors.bottom,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        levelName,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Image.network(
                                        'https://huixin.id/assets/level/$levelImage',
                                        height: 80,
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
                            );
                    }
                  },
                ),
              ),
            )
          ]
              .animate(interval: 100.ms)
              .fadeIn(duration: 200.ms, delay: 400.ms)
              .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12)
              .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad),
        ),
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
