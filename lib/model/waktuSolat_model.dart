import 'dart:convert';

import 'package:intl/intl.dart';

class waktuSolatModel{

  final DateTime  waktuSubh;
  final DateTime  waktuSyuruk;
  final DateTime  waktuZuhr;
  final DateTime  waktuAsr;
  final DateTime  waktuMaghrib;
  final DateTime  waktuIsha;

  waktuSolatModel({
   required this.waktuSubh,
    required this.waktuSyuruk,
    required this.waktuZuhr,
    required this.waktuAsr,
    required this.waktuMaghrib,
    required this.waktuIsha,
  });

  factory waktuSolatModel.fromJson(Map<String, dynamic> json){

    DateTime now = DateTime.now();
    int todayDay = now.day;

    Map<String, dynamic> data = jsonDecode(json.toString());
    List<dynamic> prayers = data['prayers'];
    Map<String, dynamic>? todayPrayers;
    for (var prayer in prayers) {
      if (prayer['day'] == todayDay) {
        todayPrayers = prayer;
        break;
      }
    }
    if (todayPrayers != null) {
      return waktuSolatModel(
        waktuSubh: DateTime.fromMillisecondsSinceEpoch(todayPrayers['fajr'] * 1000),
        waktuSyuruk: DateTime.fromMillisecondsSinceEpoch(todayPrayers['syuruk'] * 1000),
        waktuZuhr: DateTime.fromMillisecondsSinceEpoch(todayPrayers['dhuhr'] * 1000),
        waktuAsr: DateTime.fromMillisecondsSinceEpoch(todayPrayers['asr'] * 1000),
        waktuMaghrib: DateTime.fromMillisecondsSinceEpoch(todayPrayers['maghrib'] * 1000),
        waktuIsha: DateTime.fromMillisecondsSinceEpoch(todayPrayers['isha'] * 1000),
      );
    } else {
      // Handle case where there are no prayer times for today
      throw Exception('No prayer times found for today.');
    }
  }

  String get formattedSubh => DateFormat('hh:mm a').format(waktuSubh);
  String get formattedSyuruk => DateFormat('hh:mm a').format(waktuSyuruk);
  String get formattedZuhr => DateFormat('hh:mm a').format(waktuZuhr);
  String get formattedAsr => DateFormat('hh:mm a').format(waktuAsr);
  String get formattedMaghrib => DateFormat('hh:mm a').format(waktuMaghrib);
  String get formattedIsha => DateFormat('hh:mm a').format(waktuIsha);
}