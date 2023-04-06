import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/home/active_student/active_student_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/daily_activity/daily_activity_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/xp/xp_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_level/master_level_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/home/components/home_ui_avatar_loaded.dart';
import 'package:flutter_huixin_app/ui/pages/home/components/home_ui_avatar_loading.dart';
import 'package:flutter_huixin_app/ui/pages/home/components/home_ui_tile_master.dart';
import 'package:flutter_huixin_app/ui/pages/home/components/home_ui_tile_master_loading.dart';

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
                    orElse: () => 9,
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
                        return const TileMasterLevelLoading();
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
