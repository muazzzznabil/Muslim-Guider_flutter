import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_guider_v1/model/waktuSolat_model.dart';
import 'package:muslim_guider_v1/pages/prayerTime.dart';

import '../services/pray_time_service.dart';

final waktuSolatProvider = FutureProvider<PrayerTime>((ref) async {
  print('-------------------------------------------------');
  return ref.watch(waktuSolat_Provider).getTodayPrayerTime();
});