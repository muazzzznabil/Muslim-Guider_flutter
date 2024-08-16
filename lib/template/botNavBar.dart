import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() => _bottomNavigationBar();
}

class _bottomNavigationBar extends State<bottomNavigationBar>{

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return  CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xff91ca62),
        color: Color(0xff91ca62),
        animationDuration: const Duration(milliseconds: 230),
        items:  [
          CurvedNavigationBarItem(
              child: Icon(Icons.help_outline,size: 30,),
              // label: 'About'

          ),

          CurvedNavigationBarItem(
              child: Icon(Icons.home_rounded,size: 30,),
              // label: 'Homepage'
          ),

          CurvedNavigationBarItem(
              child: Icon(Icons.settings,size: 30,),
              // label: 'Settings'
          ),
        ],
        onTap: (index){
          setState(() {
            _page = index;
            if(_page == 0){
              Navigator.pushNamed(context, '/about');
            }else if(_page == 1){
              Navigator.pushNamed(context, '/homepage');
            }else if(_page == 2){
              Navigator.pushNamed(context, '/setting');
            }
          });
        },

    );
  }


}
