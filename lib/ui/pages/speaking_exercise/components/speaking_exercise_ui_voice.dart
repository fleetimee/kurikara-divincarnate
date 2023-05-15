import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart' as ap;
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_soal_speaking/master_soal_speaking_cubit.dart';
import 'package:flutter_huixin_app/cubit/soal_speaking/latihan_soal_header_speaking/latihan_soal_header_speaking_cubit.dart';
import 'package:flutter_huixin_app/cubit/soal_speaking/latihan_soal_lines/latihan_soal_lines_speaking_cubit.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/speaking_exercise/components/speaking_ecercise_ui_microphone.dart';
import 'package:flutter_huixin_app/ui/pages/speaking_exercise/components/speaking_exercise_ui_bottom_bar_button.dart';
import 'package:flutter_huixin_app/ui/pages/speaking_exercise/components/speaking_exercise_ui_correct_answer.dart';
import 'package:flutter_huixin_app/ui/pages/speaking_exercise/components/speaking_exercise_ui_preview_button.dart';
import 'package:flutter_huixin_app/ui/pages/speaking_exercise/components/speaking_exercise_ui_top_section.dart';
import 'package:flutter_huixin_app/ui/widgets/appbar/appbar_style.dart';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart'
    as fsr;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../cubit/auth/user/user_cubit.dart';
import '../../../../cubit/mastering/master_group_materi/master_group_materi_cubit.dart';
import '../../../../cubit/soal_speaking/finish_latihan_soal/finish_latihan_soal_speaking_cubit.dart';
import '../../../../data/models/latihan_soal/requests/finish_soal_request_model.dart';
import '../../../../data/models/latihan_soal/requests/latihan_lines_request_model.dart';
import '../../home/home_ui.dart';

typedef Fn = void Function();

const theSource = fsr.AudioSource.microphone;

class SpeakingExerciseVoice extends StatefulWidget {
  const SpeakingExerciseVoice({super.key});

  @override
  State<SpeakingExerciseVoice> createState() => _SpeakingExerciseVoiceState();
}

class _SpeakingExerciseVoiceState extends State<SpeakingExerciseVoice> {
  final FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  final FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _mPlayer2 = FlutterSoundPlayer();
  final FlutterSoundRecorder _mRecorder2 = FlutterSoundRecorder();

  Codec _codec = Codec.aacMP4;
  String _mPath = 'fleetime.mp4';
  final String _mPath2 = 'fleetime_2.mp4';
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mPlayerIsInited2 = false;
  bool _mRecorderIsInited2 = false;

  bool _mplaybackReady = false;
  bool _mplaybackReady2 = false;

  bool _isFirstMicClicked = false;
  bool _isSecondMicClicked = false;

  bool _isSubmitButtonPressed = false;

  late AudioPlayer player;

  DataUser? dataUser;

  void _playAudio(audioUrl) async {
    ap.AudioPlayer audioPlayer = ap.AudioPlayer();
    await audioPlayer.play(ap.UrlSource(audioUrl));
  }

  @override
  void initState() {
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

    dataUser = context.read<UserCubit>().state.maybeMap(
          orElse: () => null,
          loaded: (value) => value.data,
        );

    super.initState();
    player = AudioPlayer();
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
      audioSource: theSource,
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

  void stopRecorder() async {
    await _mRecorder.stopRecorder().then((value) {
      setState(() {
        _mplaybackReady = true;
        _isFirstMicClicked = true;
      });
    });
  }

  void stopRecorder2() async {
    await _mRecorder2.stopRecorder().then((value) {
      setState(() {
        _mplaybackReady2 = true;
        _isSecondMicClicked = true;
      });
    });
  }

  Fn? getRecorderFn() {
    if (!_mRecorderIsInited || !_mPlayer.isStopped) {
      return null;
    }
    return _mRecorder.isStopped ? record : stopRecorder;
  }

  Fn? getRecorderFn2() {
    if (!_mRecorderIsInited2 || !_mPlayer2.isStopped) {
      return null;
    }
    return _mRecorder2.isStopped ? record2 : stopRecorder2;
  }

  Fn? getPlaybackFn() {
    if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder.isStopped) {
      return null;
    }
    return _mPlayer.isStopped ? play : stopPlayer;
  }

  Fn? getPlaybackFn2() {
    if (!_mPlayerIsInited2 || !_mplaybackReady2 || !_mRecorder2.isStopped) {
      return null;
    }
    return _mPlayer2.isStopped ? play2 : stopPlayer;
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MasterSoalSpeakingCubit>().state;
    final soalHeaderState =
        context.watch<LatihanSoalHeaderSpeakingCubit>().state;

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
          controller: _scrollController,
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
                            Visibility(
                              visible: !_isFirstMicClicked,
                              child: SpeakingExerciseMicrophone(
                                text:
                                    _mRecorder.isRecording ? 'Stop' : 'Record',
                                onPressed: getRecorderFn(),
                              ),
                            ),
                            Visibility(
                              visible: _isFirstMicClicked,
                              child: SpeakingExercisePreviewButton(
                                onPressed: getPlaybackFn(),
                                name: _mPlayer.isPlaying ? 'Stop' : 'Play',
                              ),
                            ),
                            if (_isSubmitButtonPressed)
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SpeakingExerciseCorrectAnswer(
                                    onTap: () {
                                      _playAudio(
                                          '${currentSoal.fileUrl}${currentSoal.correctVoice}');
                                    },
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  SpeakingExerciseMicrophone(
                                    onPressed: getRecorderFn2(),
                                    text: _mRecorder2.isRecording
                                        ? 'Stop'
                                        : 'Record',
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Visibility(
                                    visible: _isSecondMicClicked,
                                    child: SpeakingExercisePreviewButton(
                                      onPressed: getPlaybackFn2(),
                                      name:
                                          _mPlayer2.isPlaying ? 'Stop' : 'Play',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _isFirstMicClicked && !_isSubmitButtonPressed
          ? SpeakingExerciseBottomNavBar(
              name: 'SUBMIT',
              color: AppColors.bottom,
              onTap: () {
                setState(() {
                  _isSubmitButtonPressed = true;
                });
              },
            )
          : _isSubmitButtonPressed
              ? SpeakingExerciseBottomNavBar(
                  name: state.maybeMap(
                    orElse: () => 'NEXT',
                    loading: (state) => 'LOADING',
                    loaded: (state) => state.isNext ? 'NEXT' : 'FINISH',
                  ),
                  color: _isFirstMicClicked && _isSecondMicClicked
                      ? AppColors.greenColor
                      : AppColors.greyWhite,
                  onTap: _isFirstMicClicked && _isSecondMicClicked
                      ? () {
                          state.maybeMap(
                            orElse: () {},
                            loaded: (state) async {
                              context
                                  .read<LatihanSoalLinesSpeakingCubit>()
                                  .postLatihanSoalLines(
                                      LatihanLinesRequestModel(
                                    id_log_soal_header:
                                        soalHeaderState.maybeMap(
                                      orElse: () => '',
                                      loaded: (state) => state
                                          .data.data!.idLogSoalHeader
                                          .toString(),
                                    ),
                                    id_soal:
                                        state.data.data![state.index].idSoal!,
                                    tipe: state.data.data![state.index].tipe!,
                                    pg_answer: '',
                                    cocok_answer: '',
                                    voice_answer: File(
                                        (await _mRecorder.stopRecorder())!),
                                    voice_answer_2: File(
                                        (await _mRecorder2.stopRecorder())!),
                                    status: true,
                                    user_id: dataUser!.userId!,
                                  ));
                              if (state.isNext) {
                                _isFirstMicClicked = false;
                                _isSecondMicClicked = false;
                                _isSubmitButtonPressed = false;
                                context
                                    .read<MasterSoalSpeakingCubit>()
                                    .nextContent();
                              } else {
                                context
                                    .read<FinishLatihanSoalSpeakingCubit>()
                                    .finishLatihanSoal(
                                      FinishSoalRequestModel(
                                        user_id: dataUser!.userId!,
                                        id_level: soalHeaderState.maybeMap(
                                          orElse: () => '',
                                          loaded: (state) => state
                                              .data.data!.idLevel
                                              .toString(),
                                        ),
                                        id_group_materi:
                                            soalHeaderState.maybeMap(
                                          orElse: () => '',
                                          loaded: (state) => state
                                              .data.data!.idGroupMateri
                                              .toString(),
                                        ),
                                        id_lesson: soalHeaderState.maybeMap(
                                          orElse: () => '',
                                          loaded: (state) => state
                                              .data.data!.idLesson
                                              .toString(),
                                        ),
                                        mode: 'speaking',
                                      ),
                                    );
                                context
                                    .read<MasterSoalSpeakingCubit>()
                                    .setInitial();
                                context
                                    .read<LatihanSoalHeaderSpeakingCubit>()
                                    .setInitial();
                                context
                                    .read<LatihanSoalLinesSpeakingCubit>()
                                    .setInitial();

                                context
                                    .read<MasterGroupMateriCubit>()
                                    .getMasterGroupMateri(
                                        dataUser!.userId!,
                                        soalHeaderState.maybeMap(
                                          orElse: () => '',
                                          loaded: (state) => state
                                              .data.data!.idLevel
                                              .toString(),
                                        ),
                                        soalHeaderState.maybeMap(
                                          orElse: () => '',
                                          loaded: (state) => state
                                              .data.data!.idLesson
                                              .toString(),
                                        ));

                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  HomePage.routeName,
                                  (route) => false,
                                );

                                showTopSnackBar(
                                  Overlay.of(context),
                                  const CustomSnackBar.success(
                                    message:
                                        "Exercise has been completed, please check your score in the reporting menu",
                                  ),
                                );
                              }
                            },
                          );
                        }
                      : () {},
                )
              : const SizedBox.shrink(),
    );
  }
}
