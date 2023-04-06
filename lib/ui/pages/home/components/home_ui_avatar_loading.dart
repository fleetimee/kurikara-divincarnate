import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shimmer/shimmer.dart';

class AvatarLoading extends StatelessWidget {
  const AvatarLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: CircleAvatar(
            radius: 30,
            child: RandomAvatar('fleetime'),
          ),
        ),
      ],
    );
  }
}
