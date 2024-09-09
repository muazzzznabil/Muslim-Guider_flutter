import 'dart:math';

import 'package:jhijri/jhijri.dart';

import '../pages/prayerTime.dart';

class PrayerTime {
  final String subh;
  final String syuruk;
  final String zuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String hijriDate;
  final int day;

  PrayerTime({
    required this.subh,
    required this.syuruk,
    required this.zuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.hijriDate,
    required this.day,
  });

  factory PrayerTime.fromJson(Map<String, dynamic> json) {
    return PrayerTime(
      subh: _formatTime(json['fajr']),
      syuruk: _formatTime(json['syuruk']),
      zuhr: _formatTime(json['dhuhr']),
      asr: _formatTime(json['asr']),
      maghrib: _formatTime(json['maghrib']),
      isha: _formatTime(json['isha']),
      hijriDate: json['hijri'],
      day:  json['day']

    );
  }

  static String _formatTime(int epochTime) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(epochTime * 1000);
    int hour = date.hour % 12;
    if (hour == 0) hour = 12; // Handle midnight and noon
    return "${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(
        2, '0')} ${date.hour >= 12 ? 'p.m.' : 'a.m.'}";
  }

  String determineCurrentPrayer(PrayerTime prayerTime) {
    // Get current time
    DateTime now = DateTime.now();
    // Convert prayer times to DateTime objects
    DateTime subhTime = _parsePrayerTime(prayerTime.subh);
    print(_parsePrayerTime(prayerTime.subh));
    DateTime syurukTime = _parsePrayerTime(prayerTime.syuruk);
    DateTime zuhrTime = _parsePrayerTime(prayerTime.zuhr);
    DateTime asrTime = _parsePrayerTime(prayerTime.asr);
    DateTime maghribTime = _parsePrayerTime(prayerTime.maghrib);
    DateTime ishaTime = _parsePrayerTime(prayerTime.isha);

    // Determine current prayer
    if (now.isBefore(subhTime)) {
      return 'Isha';
    } else if (now.isBefore(syurukTime)) {
      return 'Subh';
    } else if (now.isBefore(zuhrTime)) {
      return 'Syuruk';
    } else if (now.isBefore(asrTime)) {
      return 'Zuhr';
    } else if (now.isBefore(maghribTime)) {
      return 'Asr';
    } else if (now.isBefore(ishaTime)) {
      return 'Maghrib';
    } else {
      return 'Isha';
    }
  }


  //todo: convert the time to 24 hours first.
  DateTime _parsePrayerTime(String prayerTime) {
    final now = DateTime.now();
    final timeParts = prayerTime.split(' ');
    final time = timeParts[0].split(':');
    int hour = int.parse(time[0]);
    int minute = int.parse(time[1]);

    if (timeParts[1] == 'p.m.' && hour != 12) {
      hour += 12;
    } else if (timeParts[1] == 'a.m.' && hour == 12) {
      hour = 0;
    }

    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  String getPrayerTime(PrayerTime prayerTime, String prayerName) {
    // Return the time string for a given prayer name
    switch (prayerName.toLowerCase()) {
      case 'subh':
        return prayerTime.subh;
      case 'syuruk':
        return prayerTime.syuruk;
      case 'zuhr':
        return prayerTime.zuhr;
      case 'asr':
        return prayerTime.asr;
      case 'maghrib':
        return prayerTime.maghrib;
      case 'isha':
        return prayerTime.isha;
      default:
        return '';
    }
  }

  String getNextPrayer(PrayerTime prayerTime) {

    DateTime now = DateTime.now();
    // Convert prayer times to DateTime objects
    DateTime subhTime = _parsePrayerTime(prayerTime.subh);
    print('Subuh Converted time:---------------------------------------');
    print(_parsePrayerTime(prayerTime.subh));
    print('Subuh Converted time String:---------------------------------------');
    print(_parsePrayerTime(prayerTime.subh.toString()));
    DateTime syurukTime = _parsePrayerTime(prayerTime.syuruk);
    DateTime zuhrTime = _parsePrayerTime(prayerTime.zuhr);
    DateTime asrTime = _parsePrayerTime(prayerTime.asr);
    DateTime maghribTime = _parsePrayerTime(prayerTime.maghrib);
    DateTime ishaTime = _parsePrayerTime(prayerTime.isha);

    // Logic to determine the next prayer based on the current prayer
    if (now.isBefore(subhTime)) {
      return 'Subh';
    } else if (now.isBefore(syurukTime)) {
      return 'Syuruk';
    } else if (now.isBefore(zuhrTime)) {
      return 'Zuhr';
    } else if (now.isBefore(asrTime)) {
      return 'Asr';
    } else if (now.isBefore(maghribTime)) {
      return 'Maghrib';
    } else if (now.isBefore(ishaTime)) {
      return 'Isha';
    } else {
      return 'Subh'; //because after isha
    }

  }

  String calculateTimeLeft(String nextPrayerTime,PrayerTime pray) {
    DateTime now = DateTime.now();
    print('------------------now-----------------------');
    print(now);
    print('------------------conv--------');
    DateTime prayerTime = _parsePrayerTime(getPrayerTime(pray, nextPrayerTime));
    print(prayerTime);
    // DateTime prayerTime = DateTime.parse(prayTime);

    Duration diff =  prayerTime.difference(now); //bug here where the time need to be time left not time from

    if (diff.isNegative) {
      diff = now.difference(prayerTime);
    }

    int hours = diff.inHours;
    int minutes = diff.inMinutes % 60;

    return '$hours hours $minutes minutes';
  }

  List<String> onlyTime(String prayerTime){
    List<String>  time =  prayerTime.split(' ');

    return time;
  }


}
