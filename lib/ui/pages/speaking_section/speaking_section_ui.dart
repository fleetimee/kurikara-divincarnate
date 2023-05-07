import 'dart:io';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/ui/widgets/appbar/appbar_style.dart';
import 'package:flutter_huixin_app/ui/widgets/bottom_appbar_button.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart'
    as fsr;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../cubit/auth/user/user_cubit.dart';
import '../../../cubit/mastering/master_group_materi/master_group_materi_cubit.dart';
import '../../../cubit/mastering/master_materi_speaking/master_materi_speaking_cubit.dart';
import '../../../cubit/materi/finish_materi_speaking/finish_materi_speaking_cubit.dart';
import '../../../cubit/materi/loging_header_speaking/loging_header_speaking_cubit.dart';
import '../../../cubit/materi/loging_lines_speaking/loging_lines_speaking_cubit.dart';
import '../../../data/models/auth/auth_response_model.dart';
import '../../../data/models/mastering/master_group_materi_response_model.dart';
import '../../../data/models/mastering/master_materi_response_model.dart';
import '../../../data/models/materi_pelajaran/requests/finish_materi_request_model.dart';
import '../../../data/models/materi_pelajaran/requests/loging_lines_request_model.dart';
import '../../widgets/not_found.dart';
import '../home/home_ui.dart';

typedef _Fn = void Function();

class SpeakingSection extends StatefulWidget {
  static const String routeName = '/speaking_section';

  const SpeakingSection({super.key});

  @override
  State<SpeakingSection> createState() => _SpeakingSectionState();
}

class _SpeakingSectionState extends State<SpeakingSection> {
  DataUser? dataUser;
  bool _isVolumeClicked = false;
  bool _isMicrophoneClicked = false;
  bool _isMicrophoneClicked2 = false;
  int _currentContent = 0;
  int totalContent = 0;

  ReadingMateri? readingMateri;
  DataUser? user;
  late AudioPlayer player;

  final FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  final FlutterSoundPlayer _mPlayer2 = FlutterSoundPlayer();
  final FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();
  final FlutterSoundRecorder _mRecorder2 = FlutterSoundRecorder();
  Codec _codec = Codec.aacMP4;
  String _mPath = 'fleetime.mp4';
  final String _mPath2 = 'fleetime.mp4';
  bool _mPlayerIsInited = false;
  bool _mPlayerIsInited2 = false;
  bool _mRecorderIsInited = false;
  bool _mRecorderIsInited2 = false;
  bool _mplaybackReady = false;
  bool _mplaybackReady2 = false;

  MasterMateri? masterMateri;

  @override
  void initState() {
    dataUser = context.read<UserCubit>().state.maybeMap(
          orElse: () => null,
          loaded: (value) => value.data,
        );
    _mPlayer.openPlayer().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

    _mPlayer2.openPlayer().then((value) {
      setState(() {
        _mPlayerIsInited2 = true;
      });
    });

    openTheRecorder().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });

    openTheRecorder2().then((value) {
      setState(() {
        _mRecorderIsInited2 = true;
      });
    });

    user = context.read<UserCubit>().state.maybeMap(
          orElse: () => null,
          loaded: (value) => value.data,
        );
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    _mPlayer.closePlayer();

    _mRecorder.closeRecorder();
    _mRecorder2.closeRecorder();
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

  Future<void> openTheRecorder2() async {
    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await _mRecorder2.openRecorder();
    if (!await _mRecorder2.isEncoderSupported(_codec) && kIsWeb) {
      _codec = Codec.opusWebM;
      _mPath = 'tau_file.webm';
      if (!await _mRecorder2.isEncoderSupported(_codec) && kIsWeb) {
        _mRecorderIsInited2 = true;
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

    _mRecorderIsInited2 = true;
  }

  void record() {
    _mRecorder
        .startRecorder(
      toFile: _mPath,
      codec: _codec,
      audioSource: fsr.AudioSource.microphone,
    )
        .then((value) {
      setState(() {});
    });
  }

  void record2() {
    _mRecorder2
        .startRecorder(
      toFile: _mPath2,
      codec: _codec,
      audioSource: fsr.AudioSource.microphone,
    )
        .then((value) {
      setState(() {});
    });
  }

  void stopRecorder() async {
    await _mRecorder.stopRecorder().then((value) {
      setState(() {
        _mplaybackReady = true;
        _isMicrophoneClicked = true;
      });
    });
  }

  void stopRecorder2() async {
    await _mRecorder2.stopRecorder().then((value) {
      setState(() {
        _mplaybackReady2 = true;
        _isMicrophoneClicked2 = true;
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
            whenFinished: () {
              setState(() {});
            })
        .then((value) {
      setState(() {});
    });
  }

  void play2() {
    assert(_mPlayerIsInited2 &&
        _mplaybackReady2 &&
        _mRecorder2.isStopped &&
        _mPlayer2.isStopped);
    _mPlayer2
        .startPlayer(
            fromURI: _mPath2,
            whenFinished: () {
              setState(() {});
            })
        .then((value) {
      setState(() {});
    });
  }

  void playLatihanVoice(String url) {
    _mPlayer
        .startPlayer(
            fromURI: url,
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

  void stopPlayer2() {
    _mPlayer2.stopPlayer().then((value) {
      setState(() {});
    });
  }

  _Fn? getRecorderFn() {
    if (!_mRecorderIsInited || !_mPlayer.isStopped) {
      return null;
    }
    return _mRecorder.isStopped ? record : stopRecorder;
  }

  _Fn? getRecorderFn2() {
    if (!_mRecorderIsInited2 || !_mPlayer2.isStopped) {
      return null;
    }
    return _mRecorder2.isStopped ? record2 : stopRecorder2;
  }

  _Fn? getPlaybackFn() {
    if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder.isStopped) {
      return null;
    }
    return _mPlayer.isStopped ? play : stopPlayer;
  }

  _Fn? getPlaybackFn2() {
    if (!_mPlayerIsInited2 || !_mplaybackReady2 || !_mRecorder2.isStopped) {
      return null;
    }
    return _mPlayer2.isStopped ? play2 : stopPlayer2;
  }

  void _playAudio(audioUrl) async {
    await player.setUrl(audioUrl);
    player.setVolume(5.0);
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    readingMateri = ModalRoute.of(context)!.settings.arguments as ReadingMateri;

    final state = context.watch<MasterMateriSpeakingCubit>().state;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBarReading(
          title: 'Speaking',
          context: context,
        ),
        body: state.maybeMap(
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
          initial: (value) {
            context.read<MasterMateriSpeakingCubit>().getMasterMateriSpeaking(
                  user!.userId!,
                  readingMateri!.masterGroupMateri.idLevel!,
                  readingMateri!.masterGroupMateri.idGroupMateri!,
                );
            return null;
          },
          loaded: (value) {
            if (value.data.data == null || value.data.data!.isEmpty) {
              return const NotFound(
                text:
                    'This course is currently empty, please wait until the course is ready',
              );
            }
            final materi = value.data.data![_currentContent];
            masterMateri = materi;
            totalContent = value.data.data!.length;
            return Scrollbar(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
                            '${materi.latihanUrlFile}${materi.latihanImage}',
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 36),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => playLatihanVoice(
                                  '${materi.latihanUrlFile}${materi.latihanVoice}'),
                              child: Image.asset(
                                "assets/images/volume_reading.png",
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${materi.latihanCina2}',
                                    style: const TextStyle(
                                      fontSize: 28,
                                      color: AppColors.orangeColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${materi.latihanIndonesia2}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: AppColors.orangeColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: getRecorderFn(),
                              child: Image.asset(
                                "assets/images/microphone.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              _mRecorder.isRecording ? 'Stop' : 'Speak',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.yellowColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (_isMicrophoneClicked)
                        Center(
                          child: ElevatedButton(
                            onPressed: getPlaybackFn(),
                            child: const Text(
                              'Play',
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 36),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => playLatihanVoice(
                                  '${materi.latihanUrlFile}${materi.latihanVoice2}'),
                              child: Image.asset(
                                "assets/images/volume_reading.png",
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${materi.latihanCina}',
                                    style: const TextStyle(
                                      fontSize: 28,
                                      color: AppColors.orangeColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${materi.latihanIndonesia}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: AppColors.orangeColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: getRecorderFn2(),
                              child: Image.asset(
                                "assets/images/microphone.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              _mRecorder2.isRecording ? 'Stop' : 'Speak',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.yellowColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (_isMicrophoneClicked2)
                        Center(
                          child: ElevatedButton(
                            onPressed: getPlaybackFn2(),
                            child: const Text(
                              'Play',
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 90,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBarButton(
          name: totalContent == _currentContent + 2 ? 'FINISH' : 'NEXT',
          color: _isMicrophoneClicked && _isMicrophoneClicked2
              ? AppColors.greenColor
              : AppColors.greyWhite,
          onTap: !_isMicrophoneClicked && !_isMicrophoneClicked2
              ? () {}
              : totalContent == _currentContent + 2
                  ? () {
                      context.read<FinishMateriSpeakingCubit>().finishMateri(
                            FinishMateriRequestModel(
                              user_id: dataUser!.userId!,
                              id_level: masterMateri!.idLevel!,
                              id_group_materi: readingMateri!
                                  .masterGroupMateri.idGroupMateri!,
                              id_lesson: masterMateri!.idLesson!,
                            ),
                          );
                      context.read<LogingHeaderSpeakingCubit>().setInitial();
                      context.read<LogingLinesSpeakingCubit>().setInitial();
                      context.read<MasterMateriSpeakingCubit>().setInitial();
                      final newMasterGroupMateri =
                          readingMateri!.masterGroupMateri;
                      newMasterGroupMateri.statusReading = 'finish';
                      context
                          .read<MasterGroupMateriCubit>()
                          .getMasterGroupMateri(dataUser!.userId!,
                              masterMateri!.idLevel!, masterMateri!.idLesson!);

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomePage.routeName,
                        (route) => false,
                      );

                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          message:
                              "Speaking ${readingMateri!.masterGroupMateri.name} has been finished, you can proceed to the exercise section",
                        ),
                      );
                    }
                  : () async {
                      context.read<LogingLinesSpeakingCubit>().postLogingLines(
                            LogingLinesRequestModel(
                              id_log_materi_header:
                                  readingMateri!.logingHeaderId,
                              id_materi: masterMateri!.idMateri!,
                              user_id: dataUser!.userId!,
                              voice_try:
                                  File((await _mRecorder.stopRecorder())!),
                              voice_try_2:
                                  File((await _mRecorder2.stopRecorder())!),
                            ),
                          );
                      setState(
                        () {
                          ++_currentContent;
                          _isVolumeClicked = false;
                          _isMicrophoneClicked = false;

                          _isMicrophoneClicked2 = false;
                        },
                      );
                    },
        ),
      ),
    );
  }
}
