import 'package:flutter/material.dart';
import 'package:huixinapp/screen/course_done/course_done_ui.dart';
import 'package:huixinapp/screen/course_initial/course_initial_ui.dart';
import 'package:huixinapp/screen/course_selector/course_selector_ui.dart';
import 'package:huixinapp/screen/exercise_section.dart/exercise_number_one_ui.dart';
import 'package:huixinapp/screen/exercise_section.dart/exercise_number_three.dart';
import 'package:huixinapp/screen/exercise_section.dart/exercise_number_two_ui.dart';
import 'package:huixinapp/screen/home/home_ui.dart';
import 'package:huixinapp/screen/profile/detail_profile_ui.dart';
import 'package:huixinapp/screen/profile/information_ui.dart';
import 'package:huixinapp/screen/profile/profile_ui.dart';
import 'package:huixinapp/screen/reading_section/reading_section_ui.dart';
import 'package:huixinapp/screen/reporting/reporting_detail_ui.dart';
import 'package:huixinapp/screen/reporting/reporting_ui.dart';
import 'package:huixinapp/screen/signin/signin_ui.dart';
import 'package:huixinapp/screen/singup/signup_ui.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const LoginPage(),
  '/home': (context) => const HomePage(),
  '/course_selector': (context) => const CourseSelector(),
  '/course_initial': (context) => const CourseInitial(),
  '/course_done': (context) => const CourseDone(),
  '/exercise_one': (context) => const ExerciseOne(),
  '/exercise_two': (context) => const ExerciseTwo(),
  '/exercise_three': (context) => const ExerciseThree(),
  '/reading_section': (context) => const ReadingSection(),
  '/profile': (context) => const ProfilePage(),
  '/profile/profiledetail': (context) => const ProfileDetailPage(),
  '/profile/information': (context) => const InformationPage(),
  '/signup': (context) => const SignUpPage(),
  '/reporting': (context) => const ReportingPage(),
  '/reportingdetail': (context) => const ReportingDetailPage(),
};
