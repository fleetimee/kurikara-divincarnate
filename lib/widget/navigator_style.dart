import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huixinapp/app/const/color.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];

      switch (_selectedTab) {
        case _SelectedTab.home:
          Navigator.pushNamed(context, '/home');
          break;
        case _SelectedTab.ranked:
          Navigator.pushNamed(context, '/reportingdetail');
          break;
        case _SelectedTab.profile:
          Navigator.pushNamed(context, '/profile');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: DotNavigationBar(
        paddingR: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: AppColors.bottom,
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,

        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            selectedColor: Colors.white,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.bullseye),
            selectedColor: Colors.white,
          ),

          /// Search
          DotNavigationBarItem(
            icon: const Icon(Icons.people),
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

enum _SelectedTab { home, ranked, profile }
