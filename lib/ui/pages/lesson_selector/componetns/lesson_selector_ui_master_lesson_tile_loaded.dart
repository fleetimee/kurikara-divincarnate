import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/ui/pages/course_selector/course_selector_ui.dart';

import '../../../../data/models/mastering/master_lesson_response_model.dart';

class MasterLessonTile extends StatelessWidget {
  final int index;
  final Lesson lesson;

  const MasterLessonTile({
    Key? key,
    required this.index,
    required this.lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (lesson.open == true) {
          Navigator.pushNamed(
            context,
            CourseSelector.routeName,
            arguments: lesson,
          );
        }
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: lesson.open == true
            ? Container(
                color: AppColors.bottom,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${lesson.name}',
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CachedNetworkImage(
                          imageUrl:
                              '${lesson.imgUrl!.replaceAll('\t', '')}${lesson.imgFile}',
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.yellowColor,
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: AppColors.yellowColor,
                          ),
                          height: 50,
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
              ),
      ),
    );
  }
}
