import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';

class SpeakingExerciseCorrectAnswer extends StatelessWidget {
  const SpeakingExerciseCorrectAnswer({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;
  void playAnswer(String url) async {
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(UrlSource(url));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 25,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.5,
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
