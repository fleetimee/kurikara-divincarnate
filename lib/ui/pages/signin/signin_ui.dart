import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_huixin_app/cubit/auth/auth_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/ui/pages/home/home_ui.dart';
import 'package:flutter_huixin_app/ui/pages/signin/components/signin_ui_body_login.dart';
import 'package:flutter_huixin_app/ui/widgets/dialog_box.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// This controller used to get the value of the text field
  /// and pass it to the [AuthCubit]
  /// to validate the user
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// Initialize GlobalKey for [FormBuilder] widget
  /// to validate the form
  final GlobalKey<FormBuilderState> _fbKeyAuth = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      /// This code defines a state listener function that
      /// performs different actions based on the state that is
      /// returned by the [AuthCubit]
      listener: (context, state) {
        state.maybeWhen(
          loaded: (user) async {
            if (user.data != null) {
              /// Save the token to the secure storage
              await AppSecureStorage.setAccessToken(
                  user.data?.tokenApi ?? '323232');

              // Save the user to the secure storage
              await AppSecureStorage.setUser(user.data);

              /// Navigate to the home page
              /// if the user is valid
              /// and the token is saved to the secure storage
              if (context.mounted) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomePage.routeName,
                  (route) => false,
                );
              }
            } else {
              /// Show the error dialog
              /// if the user is invalid
              /// and the token is not saved to the secure storage
              ErrorDialog(
                title: 'Invalid Credentials',
                context: context,
                desc: 'Username atau Password salah',
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

      builder: (context, state) {
        return LoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: Center(
            child: Lottie.asset(
              'assets/lottie/loader.zip',
              fit: BoxFit.contain,
            ),
          ),
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
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
    );
  }
}
