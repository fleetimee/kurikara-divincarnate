import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_soal_speaking/master_soal_speaking_cubit.dart';
import 'package:flutter_huixin_app/cubit/soal_speaking/latihan_soal_header_speaking/latihan_soal_header_speaking_cubit.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/ui/widgets/appbar/appbar_style.dart';
import 'package:flutter_huixin_app/ui/widgets/bottom_appbar_button.dart';
import 'package:flutter_sound/flutter_sound.dart';

import 'package:just_audio/just_audio.dart';

class SpeakingExerciseVoice extends StatefulWidget {
  const SpeakingExerciseVoice({super.key});

  @override
  State<SpeakingExerciseVoice> createState() => _SpeakingExerciseVoiceState();
}

class _SpeakingExerciseVoiceState extends State<SpeakingExerciseVoice> {
  final FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  final FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();
  final Codec _codec = Codec.aacMP4;
  final String _mPath = 'fleetime.mp4';
  final bool _mPlayerIsInited = false;
  final bool _mRecorderIsInited = false;
  final bool _mplaybackReady = false;

  late AudioPlayer player;

  DataUser? dataUser;

  void _playAudio(audioUrl) async {
    await player.setUrl(audioUrl);
    player.play();
  }

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MasterSoalSpeakingCubit>().state;
    final soalHeaderState =
        context.watch<LatihanSoalHeaderSpeakingCubit>().state;

    // Ini toggle speaker
    bool isSpeakerPressed = false;

    // Ini kalau mic pertama di klik
    bool isFirstMicPressed = false;

    // ini kalau submit di klik
    bool isSubmitting = false;

    //

    // Ini toggle jawaban

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Exercise',
        numberOfExercises: state.maybeMap(
          orElse: () => '0',
          loaded: (value) {
            return '${value.index + 1}';
          },
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: state.maybeWhen(
                orElse: () => const SizedBox(),
                loaded: (data, index, isNext) {
                  final currentSoal = data.data![index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SpeakingExerciseTopSection(
                        imagePath:
                            '${currentSoal.fileUrl}${currentSoal.soalImage}',
                        chineseText: '${currentSoal.soalTitle}',
                        onTap: () {
                          _playAudio(
                              '${currentSoal.fileUrl}${currentSoal.soalVoice}');
                        },
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
                        height: 30,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MicrophoneImage(
                              isPressed: false,
                              onPressed: () {
                                // setState(
                                //   () {
                                //     isMicrophonePressed = true;
                                //   },
                                // );
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Speak',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: AppColors.yellowColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Center(
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Image.asset(
                      //         "assets/images/volume_reading.png",
                      //         height: 40,
                      //         fit: BoxFit.contain,
                      //       ),
                      //       const SizedBox(
                      //         width: 10,
                      //       ),
                      //       ElevatedButton(
                      //         onPressed: () {},
                      //         child: const Text('Play'),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 80,
                            width: 300,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                          const SizedBox(
                            height: 60,
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MicrophoneImage(
                                  // isPressed: isMicrophonePressed,
                                  isPressed: false,
                                  onPressed: () {},
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
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const SpeakingExerciseBottomNavBar(
        name: 'Submit',
        color: AppColors.bottom,
      ),
    );
  }
}

class SpeakingExerciseBottomNavBar extends StatelessWidget {
  const SpeakingExerciseBottomNavBar({
    super.key,
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarButton(
      color: color,
      name: name,
      onTap: () {
        // setState(
        //   () {
        //     // isSubmitButtonPressed = true;
        //   },
        // );
      },
    );
  }
}

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
            child: Image.network(
              imagePath,
              height: 200,
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
