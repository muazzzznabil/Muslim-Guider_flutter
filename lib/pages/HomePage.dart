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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: 30,),
              prayerTimeWidget(),
              SizedBox(height: 30,),
              tasbihCounterWidget(),
              SizedBox(height: 30,),
              mosqueLocatorWidget()
            ],
          ),
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
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text.rich(

                          )
                        ],
                      ),
                    )
                  ],
                ),
                Column(

                )
              ],

            ),
            Container(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  'See Prayer Times',
                  style: TextStyle(
                    color: Colors.white,
                      shadows: [
                        Shadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 10,
                            offset: Offset(0,4)
                        )
                      ]
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xff4c787e),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
              ),
            )
          ],
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

  AppBar appBar() { //KIV
    return AppBar(
      flexibleSpace: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              // child: Text('1 Muharram\n1435H'),
              child: Text.rich(
                TextSpan(
                  text: '1 Muharram\n',
                  style: TextStyle(
                    color: Color(0xfff5f2f2),
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10,
                        offset: Offset(0,4)
                      )
                    ]
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: '1453',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                          shadows: [
                      Shadow(
                      color: Colors.black.withOpacity(0.25),
                        blurRadius: 10,
                        offset: Offset(0,4)
                    )
                  ]
                      )
                    ),
                    TextSpan(text: 'H')
                  ]
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text.rich(
                  TextSpan(
                    text: 'Tuesday\n',
                    style: TextStyle(
                      fontSize: 22,
                        color: Color(0xfff5f2f2),
                        shadows: [
                    Shadow(
                    color: Colors.black.withOpacity(0.25),
                      blurRadius: 10,
                      offset: Offset(0,4)
                  )
                  ]
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: '24 October 2024',
                        style: TextStyle(
                          fontSize: 10
                        )
                      )
                    ]
                  )
              ),
            )
          ],
        ),
        height: 250,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff37553E).withOpacity(0.9),
              Color(0xff5f936B),
              Color(0xff79BB88)
            ],
          ),
          borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
        ),
      ),
  );
  }
}
