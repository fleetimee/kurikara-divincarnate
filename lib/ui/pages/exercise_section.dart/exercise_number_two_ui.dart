// ignore_for_file: unused_field, prefer_final_fields, depend_on_referenced_packages

import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_group_materi/master_group_materi_cubit.dart';
import 'package:flutter_sound/flutter_sound.dart';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:quickalert/quickalert.dart';

import '../../../common/constants/color.dart';
import '../../../cubit/auth/user/user_cubit.dart';
import '../../../cubit/mastering/master_soal/master_soal_cubit.dart';
import '../../../cubit/soal/finish_latihan_soal/finish_latihan_soal_cubit.dart';
import '../../../cubit/soal/latihan_soal_header/latihan_soal_header_cubit.dart';
import '../../../cubit/soal/latihan_soal_lines/latihan_soal_lines_cubit.dart';
import '../../../data/models/auth/auth_response_model.dart';
import '../../../data/models/latihan_soal/requests/finish_soal_request_model.dart';
import '../../../data/models/latihan_soal/requests/latihan_lines_request_model.dart';
import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/bottom_appbar_button.dart';
import '../home/home_ui.dart';

typedef Fn = void Function();

const theSource = AudioSource.microphone;

class ExerciseTwo extends StatefulWidget {
  static const String routeName = '/exercise_two';
  const ExerciseTwo({super.key});

  @override
  State<ExerciseTwo> createState() => _ExerciseTwoState();
}

class _ExerciseTwoState extends State<ExerciseTwo> {
  final FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  final FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();
  Codec _codec = Codec.aacMP4;
  String _mPath = 'huixin.mp4';
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;

  DataUser? dataUser;

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
        isAnswer = true;
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

  bool isAnswer = false;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MasterSoalCubit>().state;
    final latihanHeaderState = context.watch<LatihanSoalHeaderCubit>().state;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Exercise',
        numberOfExercises: state.maybeMap(
          orElse: () => '0',
          loaded: (state) => '${state.index + 1}',
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            state.maybeWhen(
              orElse: () => const SizedBox(),
              loaded: (data, index, isNext) {
                final currentSoal = data.data![index];
                return Container(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (currentSoal.soalImage != 'default.png')
                          CachedNetworkImage(
                            imageUrl:
                                '${currentSoal.fileUrl}${currentSoal.soalImage}',
                            height: 140,
                            errorWidget: (context, url, error) {
                              return const Icon(Icons.error);
                            },
                          ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          currentSoal.soalTitle!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: currentSoal.soalImage == 'default.png'
                                  ? 32
                                  : 16,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
                  _mRecorder.isRecording ? 'Stop' : 'Speak',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.yellowColor,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: getPlaybackFn(),
                  //color: Colors.white,
                  //disabledColor: Colors.grey,
                  child: Text(
                    _mPlayer.isPlaying ? 'Stop' : 'Play',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarButton(
        name: state.maybeMap(
          orElse: () => 'NEXT',
          loading: (state) => 'LOADING',
          loaded: (state) => state.isNext ? 'NEXT' : 'FINISH',
        ),
        color: isAnswer
            ? state.maybeMap(
                orElse: () => AppColors.bottom,
                loaded: (state) =>
                    state.isNext ? AppColors.bottom : AppColors.greenColor,
              )
            : AppColors.greyWhite,
        onTap: isAnswer
            ? () {
                state.maybeMap(
                  orElse: () {},
                  loaded: (state) async {
                    context
                        .read<LatihanSoalLinesCubit>()
                        .postLatihanSoalLines(LatihanLinesRequestModel(
                          id_log_soal_header: latihanHeaderState.maybeMap(
                            orElse: () => '',
                            loaded: (state) =>
                                state.data.data!.idLogSoalHeader.toString(),
                          ),
                          id_soal: state.data.data![state.index].idSoal!,
                          tipe: state.data.data![state.index].tipe!,
                          pg_answer: '',
                          cocok_answer: '',
                          voice_answer:
                              File((await _mRecorder.stopRecorder())!),
                          status: true,
                          user_id: dataUser!.userId!,
                        ));
                    if (state.isNext) {
                      context.read<MasterSoalCubit>().nextContent();
                    } else {
                      context.read<FinishLatihanSoalCubit>().finishLatihanSoal(
                            FinishSoalRequestModel(
                              user_id: dataUser!.userId!,
                              id_level: latihanHeaderState.maybeMap(
                                orElse: () => '',
                                loaded: (state) =>
                                    state.data.data!.idLevel.toString(),
                              ),
                              id_group_materi: latihanHeaderState.maybeMap(
                                orElse: () => '',
                                loaded: (state) =>
                                    state.data.data!.idGroupMateri.toString(),
                              ),
                              id_lesson: latihanHeaderState.maybeMap(
                                orElse: () => '',
                                loaded: (state) =>
                                    state.data.data!.idLesson.toString(),
                              ),
                              mode: 'reading',
                            ),
                          );
                      context.read<MasterSoalCubit>().setInitial();
                      context.read<LatihanSoalHeaderCubit>().setInitial();
                      context.read<LatihanSoalLinesCubit>().setInitial();
                      context
                          .read<MasterGroupMateriCubit>()
                          .getMasterGroupMateri(
                              dataUser!.userId!,
                              latihanHeaderState.maybeMap(
                                orElse: () => '',
                                loaded: (state) =>
                                    state.data.data!.idLevel.toString(),
                              ),
                              latihanHeaderState.maybeMap(
                                orElse: () => '',
                                loaded: (state) =>
                                    state.data.data!.idLesson.toString(),
                              ));

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomePage.routeName,
                        (route) => false,
                      );

                      // showTopSnackBar(
                      //   Overlay.of(context),
                      //   const CustomSnackBar.success(
                      //     message:
                      //         "Exercise has been completed, please check your score in the reporting menu",
                      //   ),
                      // );
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text:
                            'Reading exercise has been completed, please now do speaking lesson',
                      );
                    }
                  },
                );
              }
            : () {},
      ),
    );
  }
}
