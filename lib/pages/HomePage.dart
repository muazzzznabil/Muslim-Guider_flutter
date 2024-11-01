import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_guider_v1/pages/setting.dart';

import '../dataProvider/waktu_solat_provider.dart';
import '../model/waktuSolat_model.dart';
import '../services/geolocator.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double widgetWidth() => MediaQuery.of(context).size.width * 0.9;

  final items = <CurvedNavigationBarItem>[
    CurvedNavigationBarItem(
      child: Icon(Icons.home_rounded, size: 30),label: 'Home',
    ),
    CurvedNavigationBarItem(
      child: Icon(Icons.settings, size: 30),
      label: 'Settings',
    ),
  ];
  List<dynamic> _page = [
    HomePage(),
    setting(),
  ];
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    geolocatorFinder gf = new geolocatorFinder();
    gf.handleLocationPermission(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.00),
        child: appBar(),
      ),
      body: _pageIndex == 0 ? homepageBody(): setting(),
       bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xff5f936B),
        color: Color(0xff5f936B),
        animationDuration: const Duration(milliseconds: 230),
          items: items,
        onTap: (index){
          setState(() {
            _pageIndex = index;
          });
        },
      ),


    );
  }



  Row homepageBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(height: 30,),
            prayTimeWidget(),
            SizedBox(height: 30,),
            tasbihCounterWidget(),
            SizedBox(height: 30,),
            mosqueLocatorWidget(),

          ],
        ),
      ],
    );
  }

  GestureDetector tasbihCounterWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/tasbihCounter');
      },
      child: Container(
          height: 100,
          width: widgetWidth(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background/background2.png'),
                  fit: BoxFit.cover),
              color: Colors.green,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/tasbih2.svg',
                      width: 55,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tasbih Counter',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text('Resume Your Zikr',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 14,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    VerticalDivider(
                      width: 8,
                      thickness: 2,
                      color: Colors.white,
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) => LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFFFFFF),
                          Color(0xffFEF0D7),
                          Color(0xffF7A719),
                          Color(0xffF7A719),
                        ],
                      ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: Text(
                        '6572',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors
                                .black, // Use a base color (white is recommended)
                            shadows: [
                              Shadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 20,
                                  offset: Offset(4, 4))
                            ]),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }

  GestureDetector mosqueLocatorWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/mosqueLocator');
      },
      child: Container(
        height: 100,
        width: widgetWidth(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background/background3.png'),
                fit: BoxFit.cover),
            // color: Colors.yellow,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mosque Locator',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 20,
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 10,
                              offset: Offset(4, 4))
                        ]),
                  ),
                  Text(
                    'Find Nearest Mosque',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 10,
                              offset: Offset(4, 4))
                        ]),
                  )
                ],
              ),
              SvgPicture.asset('assets/icons/mosque-islam2.svg')
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    //KIV
    return AppBar(
      flexibleSpace: Container(
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
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 25),
              // child: Text('1 Muharram\n1435H'),
              child: Text.rich(TextSpan(
                  text: '1 Muharram\n',
                  style: TextStyle(
                      color: Color(0xfff5f2f2),
                      fontSize: 18,
                      shadows: [
                        Shadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ]),
                  children: <InlineSpan>[
                    TextSpan(
                        text: '1453',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            shadows: [
                              Shadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 10,
                                  offset: Offset(0, 4))
                            ])),
                    TextSpan(text: 'H')
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, top: 10),
              child: Text.rich(TextSpan(
                  text: 'Tuesday\n',
                  style: TextStyle(
                      fontSize: 28,
                      color: Color(0xfff5f2f2),
                      shadows: [
                        Shadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ]),
                  children: <InlineSpan>[
                    TextSpan(
                        text: '24 October 2024', style: TextStyle(fontSize: 13))
                  ])),
            )
          ],
        ),
      ),
    );
  }
}

class prayTimeWidget extends ConsumerWidget {
   prayTimeWidget({super.key});

  String city = 'loading...';

  final _geolocator = geolocatorFinder();

  void _getInititalInfo(BuildContext context) async {
    Position position;
    Placemark placemark;

    if(await _geolocator.getLocationPermission()){
      position = await _geolocator.getCurrentPosition();
      placemark = await _geolocator.getAddressFromLatLng(position);
      city = placemark.locality.toString();
    }else{
      city = 'Kuala Lumpur';
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
        content: Text('Unable to determine your location. Showing prayer times for Kuala Lumpur.'),
        behavior: SnackBarBehavior.floating,));
    }
  }

  @override
  Widget build(BuildContext context, ref) {

    double widgetWidth() => MediaQuery.of(context).size.width * 0.9;
    _getInititalInfo(context);
    final _waktuSolat = ref.watch(waktuSolatProvider);

    String currentPrayerName = _waktuSolat.when(
        data: (_waktuSolat) {
          String current = _waktuSolat.determineCurrentPrayer(
              PrayerTime(
                  subh: _waktuSolat.subh,
                  syuruk: _waktuSolat.syuruk,
                  zuhr: _waktuSolat.zuhr,
                  asr: _waktuSolat.asr,
                  maghrib: _waktuSolat.maghrib,
                  isha: _waktuSolat.isha,
                  hijriDate: _waktuSolat.hijriDate,
                  day: _waktuSolat.day));
          return current;
        },
        error: (err, s) => 'error!',
        loading: () => '..');
    String nextPrayerTime = _waktuSolat.when(
        data: (_waktuSolat){
          String next = _waktuSolat.getNextPrayer(
              PrayerTime(
                  subh: _waktuSolat.subh,
                  syuruk: _waktuSolat.syuruk,
                  zuhr: _waktuSolat.zuhr,
                  asr: _waktuSolat.asr,
                  maghrib: _waktuSolat.maghrib,
                  isha: _waktuSolat.isha,
                  hijriDate: _waktuSolat.hijriDate,
                  day: _waktuSolat.day));
          return next;

        },
        error: (err, s) => 'error!',
        loading: () => '..');

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/prayerTime');
      },
      child: Container(
        height: 200,
        width: widgetWidth(),
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
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 26.0),
                              child: Text.rich(
                                //Now Zuhr
                                  textAlign: TextAlign.start,
                                  TextSpan(
                                      text: 'Now : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          color: Color(0xffF5F2F2),
                                          shadows: [
                                            Shadow(
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                                blurRadius: 10,
                                                offset: Offset(4, 4))
                                          ]),
                                      children: <InlineSpan>[
                                        TextSpan(
                                            text: currentPrayerName,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ])),
                            ),
                            Text.rich(// 12:08 PM
                                TextSpan(
                                    text: _waktuSolat.when(
                                        data: (_waktuSolat) {
                                          String current =  _waktuSolat.onlyTime(_waktuSolat.getPrayerTime(PrayerTime(
                                              subh: _waktuSolat.subh,
                                              syuruk: _waktuSolat.syuruk,
                                              zuhr: _waktuSolat.zuhr,
                                              asr: _waktuSolat.asr,
                                              maghrib: _waktuSolat.maghrib,
                                              isha: _waktuSolat.isha,
                                              hijriDate: _waktuSolat.hijriDate,
                                              day: _waktuSolat.day), currentPrayerName))[0];
                                          return current;
                                        },
                                        error: (err, s) => 'error',
                                        loading: () => '00:00'),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffF5F2F2),
                                        fontSize: 28,
                                        shadows: [
                                          Shadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              blurRadius: 10,
                                              offset: Offset(4, 4))
                                        ]),
                                    children: <InlineSpan>[
                                      TextSpan(
                                          text: ' ' + _waktuSolat.when(
                                              data: (_waktuSolat) {
                                                String current =  _waktuSolat.onlyTime(_waktuSolat.getPrayerTime(PrayerTime(
                                                    subh: _waktuSolat.subh,
                                                    syuruk: _waktuSolat.syuruk,
                                                    zuhr: _waktuSolat.zuhr,
                                                    asr: _waktuSolat.asr,
                                                    maghrib: _waktuSolat.maghrib,
                                                    isha: _waktuSolat.isha,
                                                    hijriDate: _waktuSolat.hijriDate,
                                                    day: _waktuSolat.day), currentPrayerName))[1];
                                                return current;
                                              },
                                              error: (err, s) => 'error',
                                              loading: () => ''),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              fontSize: 18))
                                    ])),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Text.rich(//Next : Asr
                                  TextSpan(
                                      text: 'Next : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          color: Color(0xffF5F2F2),
                                          shadows: [
                                            Shadow(
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                                blurRadius: 10,
                                                offset: Offset(4, 4))
                                          ]),
                                      children: <InlineSpan>[
                                        TextSpan(
                                            text: nextPrayerTime,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ])),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text.rich(// 04:08 PM
                                  TextSpan(
                                      text: _waktuSolat.when(
                                      data: (_waktuSolat) {
                              String current =  _waktuSolat.onlyTime(_waktuSolat.getPrayerTime(PrayerTime(
                              subh: _waktuSolat.subh,
                              syuruk: _waktuSolat.syuruk,
                              zuhr: _waktuSolat.zuhr,
                              asr: _waktuSolat.asr,
                              maghrib: _waktuSolat.maghrib,
                              isha: _waktuSolat.isha,
                              hijriDate: _waktuSolat.hijriDate,
                              day: _waktuSolat.day), nextPrayerTime))[0];
                              return current;
                              },
                                  error: (err, s) => 'error',
                                  loading: () => '00:00'),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffF5F2F2),
                                          fontSize: 21,
                                          shadows: [
                                            Shadow(
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                                blurRadius: 10,
                                                offset: Offset(4, 4))
                                          ]),
                                      children: <InlineSpan>[
                                        TextSpan(
                                            text: ' '+ _waktuSolat.when(
                                                data: (_waktuSolat) {
                                                  String current =  _waktuSolat.onlyTime(_waktuSolat.getPrayerTime(PrayerTime(
                                                      subh: _waktuSolat.subh,
                                                      syuruk: _waktuSolat.syuruk,
                                                      zuhr: _waktuSolat.zuhr,
                                                      asr: _waktuSolat.asr,
                                                      maghrib: _waktuSolat.maghrib,
                                                      isha: _waktuSolat.isha,
                                                      hijriDate: _waktuSolat.hijriDate,
                                                      day: _waktuSolat.day), nextPrayerTime))[1];
                                                  return current;
                                                },
                                                error: (err, s) => 'error',
                                                loading: () => ''),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 11))
                                      ])),
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
                      padding: const EdgeInsets.only(top: 23, bottom: 15.0),
                      child: Row(
                        children: [
                          // SvgPicture.asset('assets/icons/map-pin-white.svg',width: 15,),
                          SvgPicture.asset(
                            'assets/icons/map-pin-white.svg',
                            width: 15,
                          ),

                          Text(
                            city,
                            style: TextStyle(
                                fontSize: 10, color: Color(0xffF5F2F2)),
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
                  style: TextStyle(color: Colors.white, shadows: [
                    Shadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10,
                        offset: Offset(4, 4))
                  ]),
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0xff4c787e),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
            )
          ],
        ),
      ),
    );
  }
}


