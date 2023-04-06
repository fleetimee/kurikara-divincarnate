import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
        // allCourseSelector[index].routeName != ''
        //     ? Navigator.pushNamed(context, allCourseSelector[index].routeName)
        //     : null;
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: AppColors.whiteColor,
        child: Column(
          children: [
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
                      return (state.data.data![index].reportReading!
                                  .isNotEmpty ||
                              state
                                  .data.data![index].reportSpeaking!.isNotEmpty)
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
          ]
              .animate(interval: 100.ms)
              .fadeIn(duration: 200.ms, delay: 400.ms)
              .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12)
              .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad),
        ),
      ),
    );
  }
}
