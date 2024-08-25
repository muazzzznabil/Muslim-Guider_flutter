import 'package:jhijri/jhijri.dart';

class PrayerTime {
  final String subh;
  final String syuruk;
  final String zuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String hijriDate;

  PrayerTime({
    required this.subh,
    required this.syuruk,
    required this.zuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.hijriDate,
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
    );
  }

  static String _formatTime(int epochTime) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(epochTime * 1000);
    int hour = date.hour % 12;
    if (hour == 0) hour = 12; // Handle midnight and noon
    return "${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(
        2, '0')} ${date.hour >= 12 ? 'p.m.' : 'a.m.'}";
  }
}
