import 'package:flutter/material.dart';
import 'package:muslim_guider_v1/pages/HomePage.dart';
import 'package:muslim_guider_v1/pages/mosqueLocator.dart';
import 'package:muslim_guider_v1/pages/prayerTime.dart';
import 'package:muslim_guider_v1/pages/tasbihCounter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false, //test  theme: ThemeData(fontFamily: 'GoogleSans'),
      theme: ThemeData(fontFamily: 'Poppins'),
      home: HomePage(),
routes: {
  '/homepage':(context) => HomePage(),
  '/mosqueLocator':(context)=> mosqueLocator(),
  '/tasbihCounter':(context)=> tasbihCounter(),
  '/prayerTime':(context)=> prayerTime(),

},
    );
  }
}

