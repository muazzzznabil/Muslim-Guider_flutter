import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:muslim_guider_v1/pages/mosqueLocator.dart';
import 'package:muslim_guider_v1/pages/tasbihCounter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: appBar(),
      body: Column(
        children: [
          SizedBox(height: 30,),
          prayerTimeWidget(),
          SizedBox(height: 30,),
          tasbihCounterWidget(),
          SizedBox(height: 30,),
          mosqueLocatorWidget()



        ],
      ),

    );
  }

  GestureDetector prayerTimeWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/prayerTime');
      },
      child: Container(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20)
        ),
        child: const Center(
          child: Text('Prayer Time'),
        ),
      ),
    );
  }

  GestureDetector tasbihCounterWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/tasbihCounter');
      },
      child: Container(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20)
        ),
        child: const Center(
          child: Text('Tasbih Counter'),
        ),
      ),
    );
  }

  GestureDetector mosqueLocatorWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/mosqueLocator');
      },
      child: Container(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(20)
        ),
        child: const Center(
          child: Text('Mosque Locator'),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
    backgroundColor: Color(0xff79BB88),
    //   backgroundColor: LinearGradient(
    //     begin: Alignment.topCenter,
    //     end: Alignment.bottomCenter,
    //     colors: [
    //       Color(0xff37553E),
    //       Color(0xff5f936B),
    //       Color(0xff79BB88)
    //     ],
    //   ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(10)
      )
    ),
  );
  }
}
