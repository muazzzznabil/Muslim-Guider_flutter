import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              mosqueLocatorWidget(),

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
          // color: Colors.blue,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff73ABA9),
                Color(0xff628E8B),
                Color(0xff203935).withOpacity(0.94)
              ],
            ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Text.rich( //Now Zuhr
                           textAlign: TextAlign.start,
                              TextSpan(
                                text: 'Now : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  color: Color(0xffF5F2F2),

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
                                  text: 'Zuhr',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    )
                                )
                                ]
                              )
                            ),

                            Text.rich( // 12:08 PM
                                TextSpan(
                                    text: '12:08 ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffF5F2F2),
                                        fontSize: 28,
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
                                          text: 'PM',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 18
                                          )
                                      )
                                    ]
                                )
                            ),

                            Text.rich( //Next : Asr
                                TextSpan(
                                    text: 'Next : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color: Color(0xffF5F2F2),
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
                                          text: 'Asr',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          )
                                      )
                                    ]
                                )
                            ),

                            Text.rich( // 04:08 PM
                                TextSpan(
                                    text: '04:08 ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffF5F2F2),
                                        fontSize: 21,
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
                                          text: 'PM',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              fontSize: 11
                                          )
                                      )
                                    ]
                                )
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 23,bottom: 15.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/map-pin-white.svg',width: 15,),
                          Text(
                              'Kuala Terengganu',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xffF5F2F2)
                            ),
                          )
                        ],
                      ),
                    ),
                    // SizedBox(height: 38,),
                    SvgPicture.asset('assets/icons/mosque-islam1.svg')
                  ],
                ),
                SizedBox()
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
