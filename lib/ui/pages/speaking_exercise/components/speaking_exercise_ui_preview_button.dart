import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';

class SpeakingExercisePreviewButton extends StatelessWidget {
  const SpeakingExercisePreviewButton({
    super.key,
    required this.name,
    this.onPressed,
  });

  final String name;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/volume_reading.png",
            height: 40,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.bottom,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
