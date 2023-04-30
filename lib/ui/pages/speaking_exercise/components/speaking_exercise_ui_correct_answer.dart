import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';

class SpeakingExerciseCorrectAnswer extends StatelessWidget {
  const SpeakingExerciseCorrectAnswer({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 80,
            width: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: AppColors.lightGreen,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Correct \nAnswer",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Image.asset(
                    "assets/images/volume_ok.png",
                    fit: BoxFit.fill,
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
