import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/ui/pages/speaking_exercise/speaking_exercise_ui.dart';
import 'package:flutter_huixin_app/ui/pages/speaking_section/speaking_section_ui.dart';

class SpeakingTile extends StatelessWidget {
  const SpeakingTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              SpeakingSection.routeName,
            );
          },
          child: Image.asset(
            "assets/images/speaking.png",
            height: 175,
            fit: BoxFit.contain,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              SpeakingExercise.routeName,
            );
          },
          child: Image.asset(
            "assets/images/speaking_exercise.png",
            height: 180,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
