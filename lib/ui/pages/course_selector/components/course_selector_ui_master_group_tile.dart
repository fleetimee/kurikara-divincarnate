import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_group_materi/master_group_materi_cubit.dart';

class MasterGroupMateriTile extends StatelessWidget {
  final int index;
  final MasterGroupMateriState state;
  final String dayName;
  final String imageUrl;

  const MasterGroupMateriTile({
    required this.index,
    super.key,
    required this.state,
    required this.dayName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        state.maybeMap(
          orElse: () => null,
          loaded: (state) {
            if (index == 0) {
              Navigator.pushNamed(
                context,
                '/course_initial',
                arguments: {
                  'level_id': state.data.data![index].idLevel,
                  'level_id_materi': state.data.data![index].idGroupMateri,
                  'level_name': state.data.data![index].name,
                },
              );
            } else {
              return (state.data.data![index].reportReading!.isNotEmpty ||
                      state.data.data![index].reportSpeaking!.isNotEmpty)
                  ? Navigator.pushNamed(
                      context,
                      '/course_initial',
                      arguments: {
                        'level_id': state.data.data![index].idLevel,
                        'level_id_materi':
                            state.data.data![index].idGroupMateri,
                        'level_name': state.data.data![index].name,
                      },
                    )
                  : showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Day Locked'),
                          content:
                              const Text('Please complete the previous day'),
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
                  if (index == 0) {
                    return Container(
                      color: AppColors.bottom,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dayName,
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Image.network(
                                'https://huixin.id/assets/group_materi/$imageUrl',
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
                    return (state.data.data![index].reportReading!.isNotEmpty ||
                            state.data.data![index].reportSpeaking!.isNotEmpty)
                        ? Container(
                            color: AppColors.bottom,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      dayName,
                                      style: const TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Image.network(
                                      'https://huixin.id/assets/group_materi/$imageUrl',
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
                          )
                        : Container(
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
