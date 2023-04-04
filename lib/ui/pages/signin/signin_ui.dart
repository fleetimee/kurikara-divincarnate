import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_huixin_app/cubit/auth/auth_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/login_request_model.dart';
import 'package:flutter_huixin_app/ui/widgets/dialog_box.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../widgets/button.dart';
import '../../widgets/login_form.dart';

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
              await AppSecureStorage.setAccessToken('323232');

              // Save the user to the secure storage
              await AppSecureStorage.setUser(user.data);

              /// Navigate to the home page
              /// if the user is valid
              /// and the token is saved to the secure storage
              if (context.mounted) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
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
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: FormBuilder(
                /// Pass the global key to the [FormBuilder] widget
                /// to validate the form
                key: _fbKeyAuth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo-login.png",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    LoginForm(
                      name: 'username',
                      label: 'Username',

                      /// Pass the controller to the [LoginForm] widget
                      /// to get the value of the text field
                      /// and pass it to the [AuthCubit]
                      controller: _usernameController,
                      obscureText: 'false',

                      /// Add [FormBuilderValidators] to validate the form
                      /// and show the error message
                      /// if the validation failed
                      validator: FormBuilderValidators.required(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginForm(
                      name: 'password',
                      label: 'Password',

                      /// Pass the controller to the [LoginForm] widget
                      /// to get the value of the text field
                      /// and pass it to the [AuthCubit]
                      controller: _passwordController,
                      obscureText: 'true',

                      /// Add [FormBuilderValidators] to validate the form
                      /// and show the error message
                      /// if the validation failed
                      validator: FormBuilderValidators.required(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Forgot Password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrimaryButton(
                      /// Render whether state is loading or not
                      /// to show the loading indicator
                      /// or the login button
                      text: state.maybeWhen(
                        loading: () => 'Loading...',
                        orElse: () => 'Login',
                      ),
                      onPressed: () {
                        if (_fbKeyAuth.currentState?.saveAndValidate() ??
                            false) {
                          /// Initialize the login request model
                          /// and pass it to the [AuthCubit]
                          /// to validate the user
                          context.read<AuthCubit>().login(
                                LoginRequestModel(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                ),
                              );

                          debugPrint('validation success');
                        } else {
                          /// Else, show the error message
                          /// And prompt user to re-enter the value
                          /// of the text field
                          debugPrint('validation failed');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: 'Don\'t have an account yet? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Animate(
              effects: const [FadeEffect(), ScaleEffect()],
              child: Image.asset(
                "assets/images/illust-login.png",
                height: 400,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}
