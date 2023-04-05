import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/auth/auth_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/daily_activity/daily_activity_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/xp/xp_cubit.dart';
import 'package:flutter_huixin_app/cubit/register/register_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/auth_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/home_datasource.dart';

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
      ],
      child: child,
    );
  }
}