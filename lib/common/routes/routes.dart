import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/ui/pages/exercise_section.dart/exercise_page.dart';
import 'package:flutter_huixin_app/ui/pages/forgot_password/forgot_password_ui.dart';
import 'package:flutter_huixin_app/ui/pages/lesson_selector/lesson_selector_ui.dart';
import 'package:flutter_huixin_app/ui/pages/signin/signin_ui.dart';
import 'package:flutter_huixin_app/ui/pages/speaking_section/speaking_section_ui.dart';

import '../../ui/pages/course_done/course_done_ui.dart';
import '../../ui/pages/course_initial/course_initial_ui.dart';
import '../../ui/pages/course_selector/course_selector_ui.dart';
import '../../ui/pages/exercise_section.dart/exercise_number_one_ui.dart';
import '../../ui/pages/exercise_section.dart/exercise_number_three.dart';
import '../../ui/pages/exercise_section.dart/exercise_number_two_ui.dart';
import '../../ui/pages/home/home_ui.dart';
import '../../ui/pages/profile/detail_profile_ui.dart';
import '../../ui/pages/profile/information_ui.dart';
import '../../ui/pages/profile/profile_ui.dart';
import '../../ui/pages/reading_section/reading_section_ui.dart';
import '../../ui/pages/reporting/reporting_detail_ui.dart';
import '../../ui/pages/reporting/reporting_ui.dart';
import '../../ui/pages/singup/signup_ui.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => const HomePage(),
  LoginPage.routeName: (context) => const LoginPage(),
  ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
  LessonSelectorPage.routeName: (context) => const LessonSelectorPage(),
  CourseSelector.routeName: (context) => const CourseSelector(),
  CourseInitial.routeName: (context) => const CourseInitial(),
  CourseDone.routeName: (context) => const CourseDone(),
  ExerciseOne.routeName: (context) => const ExerciseOne(),
  ExerciseTwo.routeName: (context) => const ExerciseTwo(),
  ExerciseThree.routeName: (context) => const ExerciseThree(),
  ReadingSection.routeName: (context) => const ReadingSection(),
  ProfilePage.routeName: (context) => const ProfilePage(),
  ProfileDetailPage.routeName: (context) => const ProfileDetailPage(),
  InformationPage.routeName: (context) => const InformationPage(),
  SignUpPage.routeName: (context) => const SignUpPage(),
  ReportingPage.routeName: (context) => const ReportingPage(),
  ReportingDetailPage.routeName: (context) => const ReportingDetailPage(),
  ExercisePage.routeName: (context) => const ExercisePage(),
  SpeakingSection.routeName: (context) => const SpeakingSection(),
};
