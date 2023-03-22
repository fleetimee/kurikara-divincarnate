import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:huixinapp/widget/button.dart';
import 'package:huixinapp/widget/login_form.dart';

import '../../app/theme/theme_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo-login.png",
              ),
              const SizedBox(
                height: 20.0,
              ),
              const LoginForm(
                label: 'Username',
                obscureText: 'false',
              ),
              const SizedBox(
                height: 20,
              ),
              const LoginForm(
                label: 'Password',
                obscureText: 'true',
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
                    child: Text(
                      'Forgot Password?',
                      style: ThemeText.textTheme1,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                text: 'GO',
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account yet? ',
                    style: ThemeText.textTheme1,
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: ThemeText.textTheme2,
                      ),
                    ],
                  ),
                ),
              )
            ],
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
  }
}
