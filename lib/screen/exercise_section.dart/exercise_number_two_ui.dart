import 'package:flutter/material.dart';
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
            const Text(
              'Ucapkan kata di atas dengan lafas \nyang benar dengan menekan icon \nmic di bawah ini',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w400,
                color: Color(0xFF000000),
              ),
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
                const Text(
                  'Speak',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD79F00),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarButton(
        name: 'NEXT',
        color: const Color(0xFFFF4546),
        onTap: () {
          Navigator.pushNamed(context, '/exercise_three');
        },
      ),
    );
  }
}
