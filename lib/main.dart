import 'package:flutter/material.dart';
import 'package:huixinapp/app/theme/theme_data.dart';
import 'package:huixinapp/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
