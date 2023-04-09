import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/auth/login_huixin/auth_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/user/user_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/active_student/active_student_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/daily_activity/daily_activity_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/xp/xp_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_level/master_level_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/update_fcm_request_model.dart';
import 'package:flutter_huixin_app/ui/pages/home/components/home_ui_items.dart';

import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/navigator_style.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
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

    String? token = await FirebaseMessaging.instance.getToken();

    setState(() {
      context.read<AuthCubit>().updateFcm(
          UpdateFcmRequestModel(user_id: user!.userId!, fcm_id: token ?? ''));
      context.read<XpCubit>().getXp(user?.userId ?? '');
      context.read<DailyActivityCubit>().getDailyActivity(user?.userId ?? '');
      context.read<ActiveStudentCubit>().getActiveStudent();
      context.read<MasterLevelCubit>().getMasterLevel(user?.userId ?? '');
      context.read<UserCubit>().setUser(user!, user!.tokenApi ?? '323232');
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
