// ignore_for_file: unused_field, prefer_final_fields, depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';


import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';

import '../../../common/constants/color.dart';
import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/bottom_appbar_button.dart';
import '../../widgets/container_course.dart';

typedef Fn = void Function();

const theSource = AudioSource.microphone;

class ExerciseTwo extends StatefulWidget {
  const ExerciseTwo({super.key});

  @override
  State<ExerciseTwo> createState() => _ExerciseTwoState();
}

class _ExerciseTwoState extends State<ExerciseTwo> {
  final FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  final FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();
  Codec _codec = Codec.aacMP4;
  String _mPath = 'fleetime.mp4';
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;

  @override
  void initState() {
    _mPlayer.openPlayer().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

    openTheRecorder().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _mPlayer.closePlayer();

    _mRecorder.closeRecorder();
    super.dispose();
  }

  Future<void> openTheRecorder() async {
    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await _mRecorder.openRecorder();
    if (!await _mRecorder.isEncoderSupported(_codec) && kIsWeb) {
      _codec = Codec.opusWebM;
      _mPath = 'tau_file.webm';
      if (!await _mRecorder.isEncoderSupported(_codec) && kIsWeb) {
        _mRecorderIsInited = true;
        return;
      }
    }
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth |
              AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));

    _mRecorderIsInited = true;
  }

  void record() {
    _mRecorder
        .startRecorder(
      toFile: _mPath,
      codec: _codec,
      audioSource: theSource,
    )
        .then((value) {
      setState(() {});
    });
  }

  void stopRecorder() async {
    await _mRecorder.stopRecorder().then((value) {
      setState(() {
        //var url = value;
        _mplaybackReady = true;
      });
    });
  }

  void play() {
    assert(_mPlayerIsInited &&
        _mplaybackReady &&
        _mRecorder.isStopped &&
        _mPlayer.isStopped);
    _mPlayer
        .startPlayer(
            fromURI: _mPath,
            //codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,
            whenFinished: () {
              setState(() {});
            })
        .then((value) {
      setState(() {});
    });
  }

  void stopPlayer() {
    _mPlayer.stopPlayer().then((value) {
      setState(() {});
    });
  }

  Fn? getRecorderFn() {
    if (!_mRecorderIsInited || !_mPlayer.isStopped) {
      return null;
    }
    return _mRecorder.isStopped ? record : stopRecorder;
  }

  Fn? getPlaybackFn() {
    if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder.isStopped) {
      return null;
    }
    return _mPlayer.isStopped ? play : stopPlayer;
  }

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
          children: [
            const SizedBox(
              height: 60,
            ),
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
                color: AppColors.blackColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: getRecorderFn(),
                  child: Image.asset(
                    "assets/images/microphone.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  _mRecorder.isRecording ? 'Stop' : 'Record',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.yellowColor,
                  ),
                ),
                ElevatedButton(
                  onPressed: getPlaybackFn(),
                  //color: Colors.white,
                  //disabledColor: Colors.grey,
                  child: Text(
                    _mPlayer.isPlaying ? 'Stop' : 'Play',
                  ),
                ),
                // Text(
                //   'Pos: $pos  dbLevel: ${((dbLevel * 100.0).floor()) / 100}',
                // ),
                // Slider(
                //   value: _mSubscriptionDuration,
                //   min: 0.0,
                //   max: 2000.0,
                //   onChanged: setSubscriptionDuration,
                //   //divisions: 100
                // ),

                // const Text(
                //   'Preview Suaramu',
                // ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       getPlayButton();
                //     },
                //     child: Text(_mPlayer!.isPlaying ? 'Stop' : 'Play'),
                //   ),
                // ),
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
