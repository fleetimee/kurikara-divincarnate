import 'package:flutter/material.dart';
import 'package:huixinapp/screen/course_done/course_done_ui.dart';
import 'package:huixinapp/screen/course_initial/course_initial_ui.dart';
import 'package:huixinapp/screen/course_selector/course_selector_ui.dart';
import 'package:huixinapp/screen/home/home_ui.dart';
import 'package:huixinapp/screen/profile/information_ui.dart';
import 'package:huixinapp/screen/profile/profile_ui.dart';
import 'package:huixinapp/screen/reading_section/reading_section_ui.dart';
import 'package:huixinapp/screen/signin/signin_ui.dart';
import 'package:huixinapp/screen/singup/signup_ui.dart';

import '../screen/profile/detail_profile_ui.dart';
import '../screen/reporting/reporting_detail_ui.dart';
import '../screen/reporting/reporting_ui.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const LoginPage(),
  '/home': (context) => const HomePage(),
  '/course_selector': (context) => const CourseSelector(),
  '/course_initial': (context) => const CourseInitial(),
  '/course_done': (context) => const CourseDone(),
  '/reading_section': (context) => const ReadingSection(),
  '/profile': (context) => const ProfilePage(),
  '/profile/profiledetail': (context) => const ProfileDetailPage(),
  '/profile/information': (context) => const InformationPage(),
  '/signup': (context) => const SignUpPage(),
  '/reporting': (context) => const ReportingPage(),
  '/reportingdetail': (context) => const ReportingDetailPage(),
};
