import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_huixin_app/cubit/auth/user/user_cubit.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_group_materi_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/course_initial/components/course_initial_ui_card_header.dart';
import 'package:flutter_huixin_app/ui/pages/course_initial/components/course_initial_ui_reading_tile.dart';
import 'package:flutter_huixin_app/ui/pages/course_initial/components/course_initial_ui_speaking_tile.dart';

import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/bottom_appbar_note.dart';

class CourseInitial extends StatefulWidget {
  static const String routeName = '/course_initial';

  const CourseInitial({super.key});

  @override
  State<CourseInitial> createState() => _CourseInitialState();
}

class _CourseInitialState extends State<CourseInitial> {
  DataUser? user;
  MasterGroupMateri? masterGroupMateri;

  @override
  void initState() {
    super.initState();
    user = context.read<UserCubit>().state.maybeMap(
          orElse: () => null,
          loaded: (value) => value.data,
        );
  }

  @override
  Widget build(BuildContext context) {
    masterGroupMateri =
        ModalRoute.of(context)!.settings.arguments as MasterGroupMateri;
    return Scaffold(
      appBar: AppBarCourse(
        title: masterGroupMateri?.name ?? '..',
        progression: '0/14',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: MateriSelector(
            masterGroupMateri: masterGroupMateri!,
            dataUser: user!,
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBarWithNotes(),
    );
  }
}

class MateriSelector extends StatelessWidget {
  final MasterGroupMateri masterGroupMateri;
  final DataUser dataUser;

  const MateriSelector({
    Key? key,
    required this.masterGroupMateri,
    required this.dataUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MateriCardHeader(
          masterGroupMateri: masterGroupMateri,
        ),
        const SizedBox(height: 16),
        ReadingTile(
          masterGroupMateri: masterGroupMateri,
          dataUser: dataUser,
        ),
        const SpeakingTile()
      ],
    );
  }
}
