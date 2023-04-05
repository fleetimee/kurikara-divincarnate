import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final void Function() onTapGoogle;
  final void Function() onTapFacebook;
  final void Function() onTapApple;

  /// Social icon button to register with Google, Facebook, or Apple
  /// it can also be used for login because it's has props onTapGoogle, onTapFacebook, onTapApple
  /// that can dynamically change the function to be executed when the icon is tapped
  const SocialIcon({
    super.key,
    required this.onTapGoogle,
    required this.onTapFacebook,
    required this.onTapApple,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTapGoogle,
          child: Image.asset(
            "assets/images/register-google.png",
            width: 50,
            height: 50,
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        GestureDetector(
          onTap: onTapFacebook,
          child: Image.asset(
            "assets/images/register-facebook.png",
            width: 50,
            height: 50,
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        GestureDetector(
          onTap: onTapApple,
          child: Image.asset(
            "assets/images/register-apple.png",
            width: 50,
            height: 50,
          ),
        ),
      ],
    );
  }
}
