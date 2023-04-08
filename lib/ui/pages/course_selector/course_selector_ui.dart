import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_group_materi/master_group_materi_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_level_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/course_selector/components/course_selector_ui_master_group_tile.dart';
import 'package:flutter_huixin_app/ui/pages/course_selector/components/course_selector_ui_master_group_tile_loading.dart';

import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/bottom_appbar_note.dart';

class CourseSelector extends StatefulWidget {
  static const String routeName = '/course_selector';
  const CourseSelector({super.key});

  @override
  State<CourseSelector> createState() => _CourseSelectorState();
}

class _CourseSelectorState extends State<CourseSelector> {
  MasterLevel? masterLevel;
  DataUser? user;

  // Future<void> _getArgs() async {
  //   args = (await Future.delayed(Duration.zero, () {
  //     return ModalRoute.of(context)?.settings.arguments as Map?;
  //   }))!;
  // }

  @override
  void initState() {
    super.initState();

    _getUser();
  }

  void _getUser() async {
    // _getArgs();
    user = await AppSecureStorage.getUser();

    // setState(() {
    //   context.read<MasterGroupMateriCubit>().getMasterGroupMateri(
    //         user?.userId ?? '',
    //         args?['level_id'] ?? '',
    //       );
    // });
  }

  @override
  Widget build(BuildContext context) {
    masterLevel = ModalRoute.of(context)!.settings.arguments as MasterLevel;
    return Scaffold(
      appBar: AppBarCourse(
        title: masterLevel?.name ?? '..',
        progression: context.select<MasterGroupMateriCubit, String>(
          (cubit) => cubit.state.maybeMap(
            orElse: () => '../..',
            loaded: (value) {
              return '${value.data.data?.length ?? 0}/${value.data.data?.length ?? 0}';
            },
          ),
        ),
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              child:
                  BlocBuilder<MasterGroupMateriCubit, MasterGroupMateriState>(
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
                    ),
                    itemBuilder: (context, index) {
                      return state.when(
                        initial: () {
                          context
                              .read<MasterGroupMateriCubit>()
                              .getMasterGroupMateri(
                                user?.userId ?? '',
                                masterLevel?.idLevel ?? '',
                              );
                          return null;
                        },
                        loading: () {
                          return const MasterGroupMateriTileLoading();
                        },
                        loaded: (data) {
                          return MasterGroupMateriTile(
                            index: index,
                            state: state,
                            masterGroupMateri: data.data![index],
                          );
                        },
                        error: (message) {
                          return Center(
                            child: Text(message),
                          );
                        },
                      );
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
