import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/data/models/get_active_student_response_model.dart';
import 'package:random_avatar/random_avatar.dart';

class AvatarLoader extends StatelessWidget {
  final int index;
  final GetActiveStudentResponseModel data;

  const AvatarLoader({
    super.key,
    required this.index,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: RandomAvatar(
            data.data![index].fullName ?? '..',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          data.data![index].fullName ?? '..',
        ),
      ],
    );
  }
}
