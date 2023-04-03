import 'package:flutter/material.dart';

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
import '../../ui/pages/signin/signin_ui.dart';
import '../../ui/pages/singup/signup_ui.dart';

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
