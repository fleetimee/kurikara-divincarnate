import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_materi/master_materi_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/reading_section/reading_section_ui.dart';

import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/bottom_appbar_note.dart';

class CourseInitial extends StatefulWidget {
  static const String routeName = '/course_initial';
  const CourseInitial({super.key});

  @override
  State<CourseInitial> createState() => _CourseInitialState();
}

class _CourseInitialState extends State<CourseInitial> {
  Map? args;
  DataUser? user;

  Future<void> _getArgs() async {
    args = (await Future.delayed(Duration.zero, () {
      return ModalRoute.of(context)?.settings.arguments as Map?;
    }))!;
  }

  @override
  void initState() {
    super.initState();

    _getUser();
  }

  void _getUser() async {
    _getArgs();
    user = await AppSecureStorage.getUser();

    setState(() {
      context.read<MasterMateriCubit>().getMasterMateri(
            user?.userId ?? '',
            args?['level_id'] ?? '',
            args?['level_id_materi'] ?? '',
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCourse(
        title: args?['level_name'] ?? '..',
        progression: '0/14',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: MateriSelector(
            args: args,
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBarWithNotes(),
    );
  }
}

class MateriSelector extends StatelessWidget {
  final Map? args;

  const MateriSelector({
    super.key,
    this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              "assets/images/container.png",
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 15,
              left: MediaQuery.of(context).size.width / 12,
              child: Image.asset(
                "assets/images/tree.png",
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 30,
              right: MediaQuery.of(context).size.width / 17,
              child: Text(
                'Lesson ${args?['level_name'] ?? '..'}',
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 70,
              right: MediaQuery.of(context).size.width / 30,
              child: Image.asset(
                "assets/images/progress_bar.png",
                height: 25,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ReadingSection.routeName);
          },
          child: Image.asset(
            "assets/images/reading.png",
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 16),
        Image.asset(
          "assets/images/exercise.png",
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
