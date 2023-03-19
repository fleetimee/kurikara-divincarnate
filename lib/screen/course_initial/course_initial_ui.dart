import 'package:flutter/material.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';
import 'package:huixinapp/widget/bottom_appbar_note.dart';

class CourseInitial extends StatelessWidget {
  const CourseInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(title: 'Nanao Ise'),
      body: const Center(
        child: Text('Course Initial'),
      ),
      bottomNavigationBar: const BottomAppBarWithNotes(),
    );
  }
}
