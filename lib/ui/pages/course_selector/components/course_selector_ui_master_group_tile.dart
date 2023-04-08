import 'package:flutter/material.dart';

import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_group_materi/master_group_materi_cubit.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_group_materi_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/course_initial/course_initial_ui.dart';

class MasterGroupMateriTile extends StatelessWidget {
  final int index;
  final MasterGroupMateriState state;
  final MasterGroupMateri masterGroupMateri;

  const MasterGroupMateriTile({
    Key? key,
    required this.index,
    required this.state,
    required this.masterGroupMateri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        state.maybeMap(
          orElse: () => null,
          loaded: (state) {
            if (masterGroupMateri.open) {
              Navigator.pushNamed(
                context,
                CourseInitial.routeName,
                arguments: masterGroupMateri,
              );
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Day Locked'),
                    content: const Text('Please complete the previous day'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: AppColors.whiteColor,
        child: Column(children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: state.maybeMap(
                orElse: () => null,
                loaded: (state) {
                  if (masterGroupMateri.open) {
                    return Container(
                      color: AppColors.bottom,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                masterGroupMateri.name ?? '',
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Image.network(
                                'https://huixin.id/assets/group_materi/${masterGroupMateri.imgFile}',
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 8),
                              Image.asset(
                                "assets/images/progress_bar.png",
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      color: AppColors.whiteColor2,
                      child: Center(
                        child: Image.asset(
                          "assets/images/lock.png",
                          height: 30,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
