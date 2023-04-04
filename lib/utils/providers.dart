import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/auth/auth_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/auth_datasource.dart';

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
        // Add more providers here
      ],
      child: child,
    );
  }
}
