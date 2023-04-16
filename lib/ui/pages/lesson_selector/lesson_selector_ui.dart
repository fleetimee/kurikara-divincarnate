import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/cubit/entities/lesson_selector.dart';
import 'package:flutter_huixin_app/ui/pages/lesson_selector/componetns/lesson_selector_ui_master_lesson_tile_loaded.dart';
import 'package:flutter_huixin_app/ui/widgets/appbar/appbar_style.dart';
import 'package:flutter_huixin_app/ui/widgets/bottom_appbar_note.dart';

class LessonSelectorPage extends StatelessWidget {
  static const String routeName = '/lesson_selector';

  const LessonSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarReading(
        title: '1A',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: allLessonSelector.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return MasterLessonTile(
                    index: index,
                  );

                  // For loading state
                  // return const MasterLessonTileLoading();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBarWithNotes(),
    );
  }
}
