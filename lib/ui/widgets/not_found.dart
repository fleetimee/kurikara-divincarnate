import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../../common/constants/color.dart';

class NotFound extends StatelessWidget {
  final String text;

  const NotFound({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/not-found.zip',
            frameRate: FrameRate(60),
            fit: BoxFit.contain,
            height: 250,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
