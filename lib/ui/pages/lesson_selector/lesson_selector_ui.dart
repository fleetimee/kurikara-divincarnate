import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/entities/lesson_selector.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_lesson/master_lesson_cubit.dart';
import 'package:flutter_huixin_app/ui/pages/lesson_selector/componetns/lesson_selector_ui_master_lesson_tile_loaded.dart';
import 'package:flutter_huixin_app/ui/widgets/appbar/appbar_style.dart';
import 'package:flutter_huixin_app/ui/widgets/bottom_appbar_note.dart';

import '../../../cubit/auth/user/user_cubit.dart';
import '../../../data/models/auth/auth_response_model.dart';
import '../../../data/models/mastering/master_level_response_model.dart';
import '../course_selector/components/course_selector_ui_master_group_tile_loading.dart';

class LessonSelectorPage extends StatefulWidget {
  static const String routeName = '/lesson_selector';

  const LessonSelectorPage({super.key});

  @override
  State<LessonSelectorPage> createState() => _LessonSelectorPageState();
}

class _LessonSelectorPageState extends State<LessonSelectorPage> {
  MasterLevel? masterLevel;
  DataUser? user;

  @override
  void initState() {
    user = context.read<UserCubit>().state.maybeMap(
          orElse: () => null,
          loaded: (value) => value.data,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    masterLevel = ModalRoute.of(context)!.settings.arguments as MasterLevel;
    return Scaffold(
      appBar: AppBarReading(
        title: '${masterLevel?.name}',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<MasterLessonCubit, MasterLessonState>(
                builder: (context, state) {
                  return GridView.builder(
                    itemCount: state.maybeMap(
                      orElse: () => 6,
                      loaded: (state) => state.data.data?.length ?? 0,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return state.when(
                        initial: () {
                          context.read<MasterLessonCubit>().getMasterLesson(
                              user?.userId ?? '', masterLevel?.idLevel ?? '');
                          return null;
                        },
                        loading: () {
                          return const MasterGroupMateriTileLoading();
                        },
                        loaded: (data) {
                          return MasterLessonTile(
                            index: index,
                            lesson: data.data![index],
                            // state: state,
                            // masterGroupMateri: data.data![index],
                          );
                        },
                        error: (message) {
                          return Center(
                            child: Text(message),
                          );
                        },
                      );

                      // For loading state
                      // return const MasterLessonTileLoading();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBarWithNotes(),
    );
  }
}
