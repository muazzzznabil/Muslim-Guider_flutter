import 'package:intl/intl.dart';
import 'package:jhijri/_src/_jHijri.dart';

class waktuSolatModel {
  final DateTime waktuSubh;
  final DateTime waktuSyuruk;
  final DateTime waktuZuhr;
  final DateTime waktuAsr;
  final DateTime waktuMaghrib;
  final DateTime waktuIsha;
  final String hijriDate;

  waktuSolatModel({
    required this.waktuSubh,
    required this.waktuSyuruk,
    required this.waktuZuhr,
    required this.waktuAsr,
    required this.waktuMaghrib,
    required this.waktuIsha,
    required this.hijriDate,
  });

  factory waktuSolatModel.fromJson(Map<String, dynamic> json) {
    try {
      // Get the current Hijri date
      String hijriDate = _formatHijriDate(DateTime.now());

      // Ensure 'prayers' is not null and is a list
      List<dynamic> prayers = (json['prayers'] as List<dynamic>?) ?? [];
      print('im here 1');

      for (var prayer in prayers) {
        print('im here 2');
        print("Hijri Date from JSON: ${prayer['hijri']}");
      }
      Map<String, dynamic>? todayPrayers;

      // Find today's prayers
      for (var prayer in prayers) {
        if (prayer['hijri'] == hijriDate) {
          todayPrayers = prayer;
          break;
        }
      }

      if (todayPrayers == null) {
        print("Calculated Hijri Date: $hijriDate");
        for (var prayer in prayers) {
          print('im here');
          print("Hijri Date from JSON: ${prayer['hijri']}");
        }
        throw FormatException("No prayers found for today.");
      }


      // Helper function to parse times from seconds
      DateTime parseTime(dynamic timeInSeconds) {
        return DateTime.fromMillisecondsSinceEpoch((timeInSeconds ?? 0) * 1000, isUtc: true);
      }

      return waktuSolatModel(
        waktuSubh: parseTime(todayPrayers['fajr']),
        waktuSyuruk: parseTime(todayPrayers['syuruk']),
        waktuZuhr: parseTime(todayPrayers['dhuhr']),
        waktuAsr: parseTime(todayPrayers['asr']),
        waktuMaghrib: parseTime(todayPrayers['maghrib']),
        waktuIsha: parseTime(todayPrayers['isha']),
        hijriDate: hijriDate,
      );
    } catch (e) {
      // Handle or log the error
      print('Error parsing WaktuSolatModel: $e');
      rethrow;
    }
  }

  // Helper method to format Hijri date from a string
  static String _formatHijriDate(DateTime date) {
    // Example of using the jhijri package to get the Hijri date
    String hijriDateStr = JHijri.now().toString(); // e.g., "19-2-1446"

    // Rearrange to "1446-02-19"
    List<String> parts = hijriDateStr.split('-');
    String day = parts[0].padLeft(2, '0');
    String month = parts[1].padLeft(2, '0');
    String year = parts[2];

    return '$year-$month-$day';
  }

  String get formattedSubh => DateFormat('HH:mm').format(waktuSubh);
  String get formattedSyuruk => DateFormat('HH:mm').format(waktuSyuruk);
  String get formattedZuhr => DateFormat('HH:mm').format(waktuZuhr);
  String get formattedAsr => DateFormat('HH:mm').format(waktuAsr);
  String get formattedMaghrib => DateFormat('HH:mm').format(waktuMaghrib);
  String get formattedIsha => DateFormat('HH:mm').format(waktuIsha);
}
