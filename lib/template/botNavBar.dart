import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guider_v1/pages/HomePage.dart';
import 'package:muslim_guider_v1/pages/setting.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() => _bottomNavigationBar();
}

class _bottomNavigationBar extends State<bottomNavigationBar> {
  List<dynamic> _page = [
    HomePage(),
    setting(),
  ];
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar : CurvedNavigationBar(
      index: _pageIndex,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: Color(0xff91ca62),
      color: Color(0xff91ca62),
      animationDuration: const Duration(milliseconds: 230),
      items: [
        CurvedNavigationBarItem(
          child: Icon(
            Icons.home_rounded,
            size: 30,
          ),
          // label: 'Homepage'
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.settings,
            size: 30,
          ),
          // label: 'Settings'
        ),
      ],
      onTap: (index) {
        setState(() {
          _pageIndex = index;
          // if (_page == 0) {
          //   Navigator.pushNamed(context, '/homepage');
          // } else if (_page == 1) {
          //   Navigator.pushNamed(context, '/setting');
          // }
        },);
      },
      letIndexChange: (index) => true,
    ),
      body: Container(
        child: _page[_pageIndex],
      ),
    );
  }
}
