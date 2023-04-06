import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/auth/auth_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/active_student/active_student_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/daily_activity/daily_activity_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/info/info_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/xp/xp_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_group_materi/master_group_materi_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_level/master_level_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_materi/master_materi_cubit.dart';
import 'package:flutter_huixin_app/cubit/register/register_cubit.dart';
import 'package:flutter_huixin_app/cubit/report/report_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/auth_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/home_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/mastering_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/report_datasource.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(
            AuthDataSource(),
          ),
        ),
        BlocProvider(
          create: (_) => RegisterCubit(
            AuthDataSource(),
          ),
        ),
        BlocProvider(
          create: (_) => XpCubit(
            HomeDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => DailyActivityCubit(
            HomeDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => ActiveStudentCubit(
            HomeDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => InfoCubit(
            HomeDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => MasterLevelCubit(
            MasteringDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => ReportCubit(
            ReportDataSource(),
          ),
        ),
        BlocProvider(
          create: (_) => MasterGroupMateriCubit(
            MasteringDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => MasterMateriCubit(
            MasteringDatasource(),
          ),
        ),
      ],
      child: child,
    );
  }
}
