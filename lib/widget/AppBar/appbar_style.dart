import 'package:flutter/material.dart';
import 'package:huixinapp/app/const/font.dart';

import '../../app/const/color.dart';

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
    borderRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(50.0),
      bottomRight: Radius.circular(50.0),
    ),
  }) : super(
          key: key,
          title: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Hi $title',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
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
                      const Text(
                        "4",
                        style: TextStyle(
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
                      const Text(
                        "13",
                        style: TextStyle(
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
          leading: Transform.translate(
            offset: const Offset(30, -2),
            child: Image.asset(
              "assets/images/home-appbar-logo.png",
              fit: BoxFit.fill,
            ),
          ),
        );
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
