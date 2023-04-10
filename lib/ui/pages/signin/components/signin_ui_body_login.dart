import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_huixin_app/cubit/auth/login_apple/login_apple_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/login_google/login_google_cubit.dart';

import 'package:flutter_huixin_app/data/models/auth/requests/login_request_model.dart';
import 'package:flutter_huixin_app/ui/pages/singup/signup_ui.dart';
import 'package:flutter_huixin_app/ui/widgets/button.dart';
import 'package:flutter_huixin_app/ui/widgets/login_form.dart';
import 'package:flutter_huixin_app/ui/widgets/social_icons_button.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../cubit/auth/login_huixin/auth_cubit.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({
    super.key,
    required GlobalKey<FormBuilderState> fbKeyAuth,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required this.state,
  })  : _fbKeyAuth = fbKeyAuth,
        _usernameController = usernameController,
        _passwordController = passwordController;

  final GlobalKey<FormBuilderState> _fbKeyAuth;
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      /// Pass the global key to the [FormBuilder] widget
      /// to validate the form
      key: _fbKeyAuth,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25.0,
            ),
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
            // Padding(
            //   padding: EdgeInsets.only(
            //       right: MediaQuery.of(context).size.width * 0.2),
            //   child: Align(
            //     alignment: Alignment.centerRight,
            //     child: TextButton(
            //       onPressed: () {},
            //       child: const Text(
            //         'Forgot Password?',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
              /// Render whether state is loading or not
              /// to show the loading indicator
              /// or the login button
              text: state.maybeWhen(
                loading: () => '..',
                orElse: () => 'GO',
              ),
              onPressed: () {
                if (_fbKeyAuth.currentState?.saveAndValidate() ?? false) {
                  context.loaderOverlay.show();

                  /// Initialize the login request model
                  /// and pass it to the [AuthCubit]
                  /// to validate the user
                  context
                      .read<AuthCubit>()
                      .login(
                        LoginRequestModel(
                          username: _usernameController.text,
                          password: _passwordController.text,
                        ),
                      )
                      .then((value) {
                    context.loaderOverlay.hide();
                  }).onError((error, stackTrace) {
                    context.loaderOverlay.hide();
                  });

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
                Navigator.pushNamed(context, SignUpPage.routeName);
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
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Or Login With',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SocialIcon(
              onTapGoogle: () {
                context.loaderOverlay.show();
                context
                    .read<LoginGoogleCubit>()
                    .loginWithGoogle()
                    .then((value) => context.loaderOverlay.hide())
                    .onError(
                        (error, stackTrace) => context.loaderOverlay.hide());
              },
              onTapFacebook: () {
                // context.read<LoginFbCubit>().loginWithFb();
              },
              onTapApple: () {
                context.loaderOverlay.show();
                context
                    .read<LoginAppleCubit>()
                    .loginWithApple()
                    .then((value) => context.loaderOverlay.hide())
                    .onError(
                        (error, stackTrace) => context.loaderOverlay.hide());
              },
            )
          ],
        ),
      ),
    );
  }
}
