import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';

class SpeakingExerciseMicrophone extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const SpeakingExerciseMicrophone({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Image.asset(
            "assets/images/microphone.png",
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.yellowColor,
            ),
          ),
        ],
      ),
    );
  }
}
