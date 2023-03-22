import 'package:flutter/material.dart';
import 'package:huixinapp/app/const/color.dart';
import 'package:huixinapp/app/theme/theme_text.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';
import 'package:huixinapp/widget/bottom_appbar_button.dart';
import 'package:huixinapp/widget/container_course.dart';

class ExerciseTwo extends StatelessWidget {
  const ExerciseTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Exercise',
        numberOfExercises: '2',
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ContainerCourse(
              text: '你好',
              color: Colors.white,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Ucapkan kata di atas dengan lafas \nyang benar dengan menekan icon \nmic di bawah ini',
              style: ThemeText.textTheme24,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            Column(
              children: [
                GestureDetector(
                  // onTap: () => setState(() {
                  //   _isMicrophoneClicked = true;
                  //   debugPrint(_isMicrophoneClicked.toString());
                  // }),
                  // onDoubleTap: () => setState(() {
                  //   if (_isMicrophoneClicked == true) {
                  //     _isReadyForNextContent = true;
                  //   }
                  // }),
                  child: Image.asset(
                    "assets/images/microphone.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Speak',
                  style: ThemeText.textTheme11,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarButton(
        name: 'NEXT',
        color: AppColors.bottom,
        onTap: () {
          Navigator.pushNamed(context, '/exercise_three');
        },
      ),
    );
  }
}
