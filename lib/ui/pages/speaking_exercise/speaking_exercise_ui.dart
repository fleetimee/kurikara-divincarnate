import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/ui/widgets/appbar/appbar_style.dart';

class SpeakingExercise extends StatefulWidget {
  static const String routeName = '/speaking_exercise';
  const SpeakingExercise({super.key});

  @override
  State<SpeakingExercise> createState() => _SpeakingExerciseState();
}

class _SpeakingExerciseState extends State<SpeakingExercise> {
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
            ],
          ),
        ),
      ),
    );
  }
}