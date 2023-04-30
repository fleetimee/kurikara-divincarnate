import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';

class SpeakingExerciseTopSection extends StatelessWidget {
  const SpeakingExerciseTopSection({
    super.key,
    required this.imagePath,
    required this.chineseText,
    this.onTap,
  });

  final String imagePath;
  final String chineseText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            // child: Image.network(
            //   imagePath,
            //   height: 200,
            //   fit: BoxFit.contain,
            // ),
            child: CachedNetworkImage(
              imageUrl: imagePath,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.yellowColor,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: AppColors.yellowColor,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: onTap,
              child: Image.asset(
                'assets/images/volume_reading.png',
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              chineseText,
              style: const TextStyle(
                fontSize: 36,
                color: AppColors.orangeColor,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
