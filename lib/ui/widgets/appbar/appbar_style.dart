import 'package:flutter/material.dart';

import '../../../common/constants/color.dart';
import '../../../common/constants/font.dart';

class AppBarDefault extends AppBar {
  AppBarDefault({
    Key? key,
    Function()? onPressed,
    required String title,
    Color? appbarColor,
    double? elevation = 4.0, // Set a default value for the elevation property
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    borderRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(50.0),
      bottomRight: Radius.circular(50.0),
    ),
    leading,
  }) : super(
          key: key,
          title: TitleAppBarDefault(labelTitle: title),
          actions: actions,
          // backgroundColor: appbarColor,
          backgroundColor: AppColors.appbarColor,
          bottom: bottom,
          elevation: elevation, // Set the elevation property
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          leading: leading,
        );
}

class AppBarHome extends AppBar {
  AppBarHome({
    Key? key,
    Function()? onPressed,
    required String title,
    Color? appbarColor,
    double? elevation = 4.0, // Set a default value for the elevation property
    PreferredSizeWidget? bottom,
    String? xp,
    String? dailyActivity,
    borderRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(50.0),
      bottomRight: Radius.circular(50.0),
    ),
  }) : super(
          key: key,
          title: Text(
            'Hi $title',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          toolbarHeight: 100,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          "assets/images/crown.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        xp ?? "0",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          "assets/images/heart.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        dailyActivity ?? "0",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          backgroundColor: AppColors.appbarColor,
          bottom: bottom,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          leadingWidth: 100,
          // leading: Transform.translate(
          //   offset: const Offset(30, -5),
          //   child: Image.asset(
          //     "assets/images/home-appbar-logo.png",
          //     fit: BoxFit.fill,
          //   ),
          // ),
          leading: const Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Image(
              image: AssetImage("assets/images/home-appbar-logo.png"),
            ),
          ),
        );
}

class AppBarCourse extends AppBar {
  AppBarCourse({
    Key? key,
    Function()? onPressed,
    required String title,
    required String progression,
    Color? appbarColor,
    double? elevation = 4.0, // Set a default value for the elevation property
    PreferredSizeWidget? bottom,
    borderRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(50.0),
      bottomRight: Radius.circular(50.0),
    ),
    required context,
  }) : super(
          key: key,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          toolbarHeight: 100,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          "assets/images/crown.png",
                          height: 25,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        progression,
                        style: const TextStyle(
                          color: Colors.black38,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          backgroundColor: AppColors.appbarColor,
          bottom: bottom,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          leadingWidth: 100,
          leading: Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Image(
                image: AssetImage("assets/images/back-button.png"),
              ),
            ),
          ),
        );
}

class AppBarReading extends AppBar {
  AppBarReading({
    Key? key,
    Function()? onPressed,
    required String title,
    Color? appbarColor,
    double? elevation = 4.0, // Set a default value for the elevation property
    PreferredSizeWidget? bottom,
    borderRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(50.0),
      bottomRight: Radius.circular(50.0),
    ),
    required context,
  }) : super(
          key: key,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          toolbarHeight: 100,
          backgroundColor: AppColors.appbarColor,
          bottom: bottom,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          leadingWidth: 100,
          leading: Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Image(
                image: AssetImage("assets/images/back-button.png"),
              ),
            ),
          ),
        );
}

class AppBarExercise extends AppBar {
  AppBarExercise({
    Key? key,
    Function()? onPressed,
    required String title,
    Color? appbarColor,
    List<Widget>? actions,
    double? elevation = 4.0, // Set a default value for the elevation property
    borderRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(50.0),
      bottomRight: Radius.circular(50.0),
    ),
    required context,
  }) : super(
          key: key,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          actions: actions,
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: AppColors.appbarColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        );
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.numberOfExercises,
    this.appbarColor,
    this.actions,
  }) : super(key: key);

  final String title;
  final Color? appbarColor;
  final String numberOfExercises;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppBarExercise(
          title: title,
          context: context,
          actions: actions,
        ),
        Positioned(
          top: 80,
          left: 50,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.bottom,
            child: Text(
              numberOfExercises,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50);
}

class TitleAppBarDefault extends StatelessWidget {
  final String labelTitle;

  const TitleAppBarDefault({Key? key, required this.labelTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // decoration: BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.3),
      //       spreadRadius: 2,
      //       blurRadius: 4,
      //       offset: const Offset(0, 2), // changes position of shadow
      //     ),
      //   ],
      // ),
      child: Text(
        labelTitle,
        style: FontProperties.appBarMain,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class AppBarBack extends AppBar {
  AppBarBack({
    Key? key,
    required String title,
    Color? appbarColor,
    double? elevation = 4.0,
    PreferredSizeWidget? bottom,
    BorderRadius borderRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(50.0),
      bottomRight: Radius.circular(50.0),
    ),
    BuildContext? context, // optional parameter with default value of null
  }) : super(
          key: key,
          title: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: appbarColor ?? AppColors.appbarColor,
          bottom: bottom,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          leading: GestureDetector(
            onTap: () {
              if (context != null) {
                Navigator.pop(
                    context); // Navigate back to previous screen using the provided context
              }
            },
            child: Transform.translate(
              offset: const Offset(30, -5),
              child: Image.asset(
                "assets/images/appbarback.png",
                fit: BoxFit.fill,
                // height: 20,
                // width: 20,
              ),
            ),
          ),
        );
}
