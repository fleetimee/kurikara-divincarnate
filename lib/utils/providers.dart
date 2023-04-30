import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/auth/delete_user/delete_user_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/forgot_password/forgot_password_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/login_apple/login_apple_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/login_google/login_google_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/login_huixin/auth_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/register_apple/register_apple_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/register_google/register_google_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/update_user/update_user_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/user/user_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/active_student/active_student_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/daily_activity/daily_activity_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/info/info_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/xp/xp_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_group_materi/master_group_materi_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_lesson/master_lesson_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_level/master_level_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_materi/master_materi_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_soal/master_soal_cubit.dart';
import 'package:flutter_huixin_app/cubit/materi/finish_materi/finish_materi_cubit.dart';
import 'package:flutter_huixin_app/cubit/materi/loging_header/loging_header_cubit.dart';
import 'package:flutter_huixin_app/cubit/materi/loging_lines/loging_lines_cubit.dart';
import 'package:flutter_huixin_app/cubit/report/report_cubit.dart';
import 'package:flutter_huixin_app/cubit/soal/finish_latihan_soal/finish_latihan_soal_cubit.dart';
import 'package:flutter_huixin_app/cubit/soal/latihan_soal_header/latihan_soal_header_cubit.dart';
import 'package:flutter_huixin_app/cubit/soal/latihan_soal_lines/latihan_soal_lines_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/auth_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/firebase_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/home_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/mastering_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/materi_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/report_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/soal_datasource.dart';

import '../cubit/auth/register/register_cubit.dart';
import '../cubit/mastering/master_materi_speaking/master_materi_speaking_cubit.dart';
import '../cubit/mastering/master_soal_speaking/master_soal_speaking_cubit.dart';
import '../cubit/materi/finish_materi_speaking/finish_materi_speaking_cubit.dart';
import '../cubit/materi/loging_header_speaking/loging_header_speaking_cubit.dart';
import '../cubit/materi/loging_lines_speaking/loging_lines_speaking_cubit.dart';
import '../cubit/soal_speaking/finish_latihan_soal/finish_latihan_soal_speaking_cubit.dart';
import '../cubit/soal_speaking/latihan_soal_header_speaking/latihan_soal_header_speaking_cubit.dart';
import '../cubit/soal_speaking/latihan_soal_lines/latihan_soal_lines_speaking_cubit.dart';
import '../data/datasources/materi_speaking_datasource.dart';
import '../data/datasources/speaking_datasource.dart';

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
          create: (_) => MasterLessonCubit(
            MasteringDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => MasterMateriCubit(
            MasteringDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => MasterMateriSpeakingCubit(
            MasteringDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => MasterSoalSpeakingCubit(
            MasteringDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => MasterSoalCubit(
            MasteringDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => UserCubit(),
        ),
        BlocProvider(
          create: (_) => LogingHeaderCubit(
            MateriDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => LogingLinesCubit(
            MateriDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => FinishMateriCubit(
            MateriDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => LogingHeaderSpeakingCubit(
            MateriSpeakingDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => LogingLinesSpeakingCubit(
            MateriSpeakingDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => FinishMateriSpeakingCubit(
            MateriSpeakingDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => LatihanSoalHeaderCubit(
            SoalDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => LatihanSoalLinesCubit(
            SoalDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => FinishLatihanSoalCubit(
            SoalDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => LatihanSoalHeaderSpeakingCubit(
            SpeakingDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => LatihanSoalLinesSpeakingCubit(
            SpeakingDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => FinishLatihanSoalSpeakingCubit(
            SpeakingDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => LoginGoogleCubit(
            AuthDataSource(),
            FirebaseDataSource(
              auth: FirebaseAuth.instance,
            ),
          ),
        ),
        BlocProvider(
          create: (_) => LoginAppleCubit(
            AuthDataSource(),
            FirebaseDataSource(
              auth: FirebaseAuth.instance,
            ),
          ),
        ),
        BlocProvider(
          create: (_) => RegisterAppleCubit(
              AuthDataSource(),
              FirebaseDataSource(
                auth: FirebaseAuth.instance,
              )),
        ),
        BlocProvider(
          create: (_) => RegisterGoogleCubit(
            AuthDataSource(),
            FirebaseDataSource(
              auth: FirebaseAuth.instance,
            ),
          ),
        ),
        BlocProvider(
          create: (_) => UpdateUserCubit(
            AuthDataSource(),
          ),
        ),
        BlocProvider(
          create: (_) => DeleteUserCubit(
            AuthDataSource(),
          ),
        ),
        BlocProvider(
          create: (_) => ForgotPasswordCubit(
            AuthDataSource(),
          ),
        ),
      ],
      child: child,
    );
  }
}
