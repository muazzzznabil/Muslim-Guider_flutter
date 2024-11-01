import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_guider_v1/pages/ContactUs.dart';
import 'package:muslim_guider_v1/pages/HomePage.dart';
import 'package:muslim_guider_v1/pages/TasbihRecords.dart';
import 'package:muslim_guider_v1/pages/about.dart';
import 'package:muslim_guider_v1/pages/mosqueLocator.dart';
import 'package:muslim_guider_v1/pages/prayerTime.dart';
import 'package:muslim_guider_v1/pages/setting.dart';
import 'package:muslim_guider_v1/pages/tasbihCounter.dart';

void main() async{
  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false, //test  theme: ThemeData(f`ontFamily: 'GoogleSans'),
      theme: ThemeData(fontFamily: 'Poppins'),
      home: HomePage(),
      routes: {
        '/homepage':(context) => HomePage(),
        '/mosqueLocator':(context)=> mosqueLocator(),
        '/tasbihCounter':(context)=> TasbihCounter(),
        '/prayerTime':(context)=> prayerTime(),
        '/tasbihRecords':(context)=> tasbihRecords(),
        '/about':(context) => aboutPage(),
        '/setting':(context) => setting(),
        '/contactUs':(context) => contactUs(),



      },
    );
  }
}

