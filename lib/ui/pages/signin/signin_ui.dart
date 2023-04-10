import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/cubit/auth/login_apple/login_apple_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/login_google/login_google_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/login_huixin/auth_cubit.dart';

import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/ui/pages/home/home_ui.dart';
import 'package:flutter_huixin_app/ui/pages/signin/components/signin_ui_body_login.dart';
import 'package:flutter_huixin_app/ui/widgets/dialog_box.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login-page';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormBuilderState> _fbKeyAuth = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (user) async {
                if (user.data != null) {
                  await AppSecureStorage.setAccessToken(
                      user.data?.tokenApi ?? '323232');

                  await AppSecureStorage.setUser(user.data);

                  if (context.mounted) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomePage.routeName,
                      (route) => false,
                    );
                  }
                } else {
                  ErrorDialog(
                    title: 'Invalid Credentials',
                    context: context,
                    desc: 'Your username or password is incorrect',
                    btnOkText: 'OK',
                    btnOkOnPress: () {},
                  ).show();
                }
              },
              error: (error) {
                ErrorDialog(
                  title: 'Error',
                  context: context,
                  desc: error,
                  btnOkText: 'OK',
                  btnOkOnPress: () {},
                ).show();
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<LoginGoogleCubit, LoginGoogleState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (user) async {
                if (user.data != null) {
                  await AppSecureStorage.setAccessToken(
                      user.data?.tokenApi ?? '323232');

                  await AppSecureStorage.setUser(user.data);

                  if (context.mounted) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomePage.routeName,
                      (route) => false,
                    );
                  }
                } else {
                  ErrorDialog(
                    title: 'Invalid Credentials',
                    context: context,
                    desc: 'Login with Google failed',
                    btnOkText: 'OK',
                    btnOkOnPress: () {},
                  ).show();
                }
              },
              error: (error) {
                ErrorDialog(
                  title: 'Error',
                  context: context,
                  desc: error,
                  btnOkText: 'OK',
                  btnOkOnPress: () {},
                ).show();
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<LoginAppleCubit, LoginAppleState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (user) async {
                if (user.data != null) {
                  await AppSecureStorage.setAccessToken(
                      user.data?.tokenApi ?? '323232');

                  await AppSecureStorage.setUser(user.data);

                  if (context.mounted) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomePage.routeName,
                      (route) => false,
                    );
                  }
                } else {
                  ErrorDialog(
                    title: 'Invalid Credentials',
                    context: context,
                    desc: 'Login with Apple failed',
                    btnOkText: 'OK',
                    btnOkOnPress: () {},
                  ).show();
                }
              },
              error: (error) {
                ErrorDialog(
                  title: 'Error',
                  context: context,
                  desc: error,
                  btnOkText: 'OK',
                  btnOkOnPress: () {},
                ).show();
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: DoubleBackToCloseApp(
                snackBar: const SnackBar(
                  content: Text(
                    'Press back again to exit the app',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  closeIconColor: Colors.white,
                  backgroundColor: AppColors.yellowColor,
                  showCloseIcon: true,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.transparent,
                        child: Animate(
                          effects: const [FadeEffect(), ScaleEffect()],
                          child: Image.asset(
                            "assets/images/illust-login.png",
                            height: 400,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    BodyLogin(
                      fbKeyAuth: _fbKeyAuth,
                      usernameController: _usernameController,
                      passwordController: _passwordController,
                      state: state,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
