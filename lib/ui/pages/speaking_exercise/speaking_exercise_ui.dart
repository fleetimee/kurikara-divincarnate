import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/ui/widgets/appbar/appbar_style.dart';
import 'package:flutter_huixin_app/ui/widgets/bottom_appbar_button.dart';

class SpeakingExercise extends StatefulWidget {
  static const String routeName = '/speaking_exercise';
  const SpeakingExercise({super.key});

  @override
  State<SpeakingExercise> createState() => _SpeakingExerciseState();
}

class _SpeakingExerciseState extends State<SpeakingExercise> {
  bool isMicrophonePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Exercise',
        numberOfExercises: '1',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 250,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 8),
                      spreadRadius: -3,
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/chinese-people.png",
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/volume_reading.png",
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '你 叫 什么 名字？',
                    style: TextStyle(
                      fontSize: 36,
                      color: AppColors.orangeColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Answer :',
                style: TextStyle(
                  fontSize: 36,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Visibility(
                visible: isMicrophonePressed ? false : true,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MicrophoneImage(
                        isPressed: isMicrophonePressed,
                        onPressed: () {
                          setState(
                            () {
                              isMicrophonePressed = true;
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Speak',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.yellowColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isMicrophonePressed,
                child: Center(
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
                        onPressed: () {},
                        child: const Text('Play'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: isMicrophonePressed
          ? BottomNavigationBarButton(
              color: AppColors.orangeColor,
              name: 'Submit',
              onTap: () {
                // Navigator.pushNamed(context, '/speaking_exercise_result');
              },
            )
          : const SizedBox(
              height: 0,
            ),
    );
  }
}

class MicrophoneImage extends StatelessWidget {
  final bool isPressed;
  final VoidCallback onPressed;

  const MicrophoneImage({
    super.key,
    required this.isPressed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset(
        "assets/images/microphone.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
