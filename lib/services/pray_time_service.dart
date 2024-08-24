import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:jhijri/_src/_jHijri.dart';

import '../model/waktuSolat_model.dart';

class PrayerTimeService {
  final String zone = 'TRG01';

  Future<PrayerTime> getTodayPrayerTime() async {
    print('--------------------------praytime service-----------------------');

    final response = await http.get(Uri.parse('https://api.waktusolat.app/v2/solat/TRG01'));
    // print('-----------------------------------------------------------------------------------------------------------------------------------------------');

    if (response.statusCode == 200) {
      final List<dynamic> prayers = jsonDecode(response.body)['prayers'];
      final String todayHijri = JHijri.now().toString();
      print(todayHijri);
      List<String> parts = todayHijri.split('-');

      // Rearrange and reformat the parts to "year-month-day"
      String todayHijriDate = "${parts[2]}-${parts[1].padLeft(2, '0')}-${parts[0].padLeft(2, '0')}";
      print('-------------------------------success-------------------------------------------------------');
      print(todayHijriDate);
      for (var prayerJson in prayers) {
        PrayerTime prayerTime = PrayerTime.fromJson(prayerJson);
        if (prayerTime.hijriDate == todayHijriDate) {
          print(prayerTime.hijriDate);
          print('-------------------------------DATEEEEE-------------------------------------------------------');
          print(todayHijriDate);
          return prayerTime;
        }
      }
    } else {
      throw Exception("Failed to load prayer times");
    }

    return Future.error('error fetching data');
  }
}
final waktuSolat_Provider = Provider<PrayerTimeService>((ref)=>PrayerTimeService());