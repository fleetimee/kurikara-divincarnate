// ignore_for_file: unused_field, prefer_final_fields, depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:huixinapp/app/const/color.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';
import 'package:huixinapp/widget/bottom_appbar_button.dart';
import 'package:huixinapp/widget/container_course.dart';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:permission_handler/permission_handler.dart';

typedef Fn = void Function();

class ExerciseTwo extends StatefulWidget {
  const ExerciseTwo({super.key});

  @override
  State<ExerciseTwo> createState() => _ExerciseTwoState();
}

class _ExerciseTwoState extends State<ExerciseTwo> {
  final FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  final FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();
  // FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  Codec _codec = Codec.aacMP4;
  String _mPath = 'fleetime.mp4';
  bool _mRecorderIsInited = false;
  double _mSubscriptionDuration = 0;
  StreamSubscription? _recorderSubscription;
  int pos = 0;
  double dbLevel = 0;
  bool _mPlayerIsInited = false;
  bool _mplaybackReady = false;

  @override
  void initState() {
    super.initState();

    init().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });

    _mPlayer.openPlayer().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });
  }

  Future<void> init() async {
    // _mPlayer!.openPlayer().then((value) {
    //   setState(() {
    //     _mPlayerIsInited = true;
    //   });
    // });

    await openTheRecorder();
    _recorderSubscription = _mRecorder.onProgress!.listen((e) {
      setState(() {
        pos = e.duration.inMilliseconds;
        if (e.decibels != null) {
          dbLevel = e.decibels as double;
        }
      });
    });
  }

  @override
  void dispose() {
    stopRecorder(_mRecorder);
    _mplaybackReady = true;
    cancelRecorderSubscriptions();

    // Be careful : you must `close` the audio session when you have finished with it.
    _mRecorder.closeRecorder();

    stopPlayer();
    // Be careful : you must `close` the audio session when you have finished with it.
    _mPlayer.closePlayer();

    super.dispose();
  }

  void cancelRecorderSubscriptions() {
    if (_recorderSubscription != null) {
      _recorderSubscription!.cancel();
      _recorderSubscription = null;
    }
  }

  void play() async {
    await _mPlayer.startPlayer(
        fromURI: _mPath,
        whenFinished: () {
          setState(() {});
        });
    setState(() {});
  }

  Future<void> stopPlayer() async {
    await _mPlayer.stopPlayer();
  }

  // void stopPlayer() {
  //   _mPlayer!.stopPlayer().then((value) {
  //     setState(() {});
  //   });
  // }

  Future<void> openTheRecorder() async {
    if (!kIsWeb) {
      // Get microphone permission before opening the recorder
      final status = await Permission.microphone.request();

      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await _mRecorder.openRecorder();
    if (!await _mRecorder.isEncoderSupported(_codec) && kIsWeb) {
      _codec = Codec.opusWebM;
      _mPath = 'fleetime.webm';
      if (!await _mRecorder.isEncoderSupported(_codec) && kIsWeb) {
        _mRecorderIsInited = true;
        return;
      }
    }

    // Permission for android

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

  void record(FlutterSoundRecorder? recorder) async {
    await recorder!.startRecorder(codec: _codec, toFile: _mPath);
    setState(() {});
  }

  Future<void> stopRecorder(FlutterSoundRecorder recorder) async {
    await recorder.stopRecorder();
  }

  Future<void> setSubscriptionDuration(
      double d) async // v is between 0.0 and 2000 (milliseconds)
  {
    _mSubscriptionDuration = d;
    setState(() {});
    await _mRecorder.setSubscriptionDuration(
      Duration(milliseconds: d.floor()),
    );
  }

  Fn? getPlaybackFn(FlutterSoundRecorder? recorder) {
    if (!_mRecorderIsInited) {
      return null;
    }
    return recorder!.isStopped
        ? () {
            record(recorder);
          }
        : () {
            stopRecorder(recorder).then((value) => setState(() {}));
          };
  }

  // Fn? getPlayButton() {
  //   if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder.isStopped) {
  //     return null;
  //   }
  //   return _mPlayer!.isStopped ? play : stopPlayer;
  // }

  Fn? getPlay() {
    if (!_mPlayerIsInited) {
      return null;
    }
    return _mPlayer.isStopped
        ? play
        : () {
            stopPlayer().then((value) => setState(() {}));
          };
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
                color: AppColors.blackColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: getPlaybackFn(_mRecorder),
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
                  onPressed: getPlay(),
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
