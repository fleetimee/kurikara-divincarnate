import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'common/constants/color.dart';
import 'common/routes/routes.dart';
import 'common/themes/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 480,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(
          color: AppColors.backgroundcolor,
        ),
      ),
      title: 'Hui Xin: MANDARIN LEARNING CENTER',
      theme: myLightTheme,
      darkTheme: myDarkTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
