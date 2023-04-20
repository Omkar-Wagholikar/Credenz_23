import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../Other Pages/Schedule_Page/views/ScrollViewSchedule.dart';
import '../../test2.dart';

class BNavBar extends StatefulWidget {
  final int activeBar;
  BNavBar({required this.activeBar, super.key});

  @override
  State<BNavBar> createState() => _BNavBarState();
}

class _BNavBarState extends State<BNavBar> {
  late int _selectedIndex;
  static List<Widget> pages = <Widget>[
    const ScheduleScreen(),
    const ScheduleScreen(),
    // const PanoAndBottomNavBar(),
    const CustomAppBar_and_Screen(),
    // const PanoAndBottomNavBar(),
    // const PanoAndBottomNavBar(),
  ];

  Color changeColor(bool selected) {
    if (selected) {
      return const Color.fromARGB(255, 255, 255, 255);
    }
    return Colors.blue.shade300;
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.activeBar;
  }

  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: CurvedNavigationBar(
        // key: _bottomNavigationKey,
        index: _selectedIndex,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.event,
              size: 28,
              color:
                  _selectedIndex == 0 ? changeColor(true) : changeColor(false)),
          Icon(Icons.perm_contact_calendar,
              size: 28,
              color:
                  _selectedIndex == 1 ? changeColor(true) : changeColor(false)),
          Icon(Icons.home,
              size: 28,
              color:
                  _selectedIndex == 2 ? changeColor(true) : changeColor(false)),
          Icon(Icons.info_outline,
              size: 28,
              color:
                  _selectedIndex == 3 ? changeColor(true) : changeColor(false)),
          Icon(Icons.account_circle,
              size: 28,
              color:
                  _selectedIndex == 4 ? changeColor(true) : changeColor(false)),
        ],
        color: Colors.white.withOpacity(0.2),
        buttonBackgroundColor: Colors.white.withOpacity(0.2),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pages[index]),
          );
          // setState(() {
          //   _selectedIndex = index;
          // });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
