import 'package:flutter/material.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';

import '../../widget/navigator_style.dart';

class ReportingPage extends StatelessWidget {
  const ReportingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: "Profile",
      ),
      body: const Center(
        child: Text('Reporting'),
      ),
      bottomNavigationBar: const NavigatorBar(),
    );
  }
}
