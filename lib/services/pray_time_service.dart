import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:jhijri/_src/_jHijri.dart';
import 'package:muslim_guider_v1/services/geolocator.dart';

import '../model/waktuSolat_model.dart';

class PrayerTimeService {

  final _geolocator = geolocatorFinder();

  Future<PrayerTime> getTodayPrayerTime() async {
    String zone = 'WLY01';
    Position position;
    Placemark placemark;

    if(await _geolocator.getLocationPermission()){

      position = await _geolocator.getCurrentPosition();
      placemark = await _geolocator.getAddressFromLatLng(position);

      String  city = placemark.locality.toString();
      zone = _zoneCode(city);
      print(city);
      print(zone);
      print('--------------Seuccess------------------');
    }else{
       zone = 'WLY01';
      print('----------------Error----------------');

    }


    final response = await http.get(Uri.parse('https://api.waktusolat.app/v2/solat/$zone'));
    if (response.statusCode == 200) {
      final List<dynamic> prayers = jsonDecode(response.body)['prayers'];
      final String todayHijri = JHijri.now().toString();
      print(todayHijri);
      List<String> parts = todayHijri.split('-');


      String todayHijriDate = "${parts[2]}-${parts[1].padLeft(2, '0')}-${parts[0]}";
      int dayNow = DateTime.now().day;
      print(todayHijriDate);
      for (var prayerJson in prayers) {
        PrayerTime prayerTime = PrayerTime.fromJson(prayerJson);
        if (prayerTime.day == dayNow) {
          print(prayerTime.day);
          print(dayNow);
          return prayerTime;
        }
      }
    } else {
      throw Exception("Failed to load prayer times");
    }
    print('Failed to fetch prayer times with status code: ${response.statusCode}');
    return Future.error('error fetching data!');
  }
}
final waktuSolat_Provider = Provider<PrayerTimeService>((ref)=>PrayerTimeService());

String _zoneCode(String placeName){

  String place = placeName.toLowerCase();
  // Johor
  if (['pulau aur', 'pulau pemanggil'].contains(place)) {
    return 'JHR01';
  } else if (['johor bahru', 'kota tinggi', 'mersing', 'kulai'].contains(place)) {
    return 'JHR02';
  } else if (['kluang', 'pontian'].contains(place)) {
    return 'JHR03';
  } else if (['batu pahat', 'muar', 'segamat', 'gemas johor', 'tangkak'].contains(place)) {
    return 'JHR04';
  }

  // Kedah
  else if (['kota setar', 'kubang pasu', 'pokok sena'].contains(place)) {
    return 'KDH01';
  } else if (['kuala muda', 'yan', 'pendang'].contains(place)) {
    return 'KDH02';
  } else if (['padang terap', 'sik', 'kuala nerang'].contains(place)) {
    return 'KDH03';
  } else if (['baling'].contains(place)) {
    return 'KDH04';
  } else if (['bandar baharu', 'kulim'].contains(place)) {
    return 'KDH05';
  } else if (['langkawi'].contains(place)) {
    return 'KDH06';
  } else if (['puncak gunung jerai'].contains(place)) {
    return 'KDH07';
  }

  // Kelantan
  else if (['bachok', 'kota bharu', 'machang', 'pasir mas', 'pasir puteh', 'tanah merah', 'tumpat', 'kuala krai', 'mukim chiku'].contains(place)) {
    return 'KTN01';
  } else if (['gua musang', 'jeli', 'jajahan kecil lojing'].contains(place)) {
    return 'KTN02';
  }

  // Melaka
  else if (['seluruh negeri melaka'].contains(place)) {
    return 'MLK01';
  }

  // Negeri Sembilan
  else if (['tampin', 'jempol'].contains(place)) {
    return 'NGS01';
  } else if (['jelebu', 'kuala pilah', 'rembau'].contains(place)) {
    return 'NGS02';
  } else if (['port dickson', 'seremban'].contains(place)) {
    return 'NGS03';
  }

  // Pahang
  else if (['pulau tioman'].contains(place)) {
    return 'PHG01';
  } else if (['kuantan', 'pekan', 'rompin', 'muadzam shah'].contains(place)) {
    return 'PHG02';
  } else if (['jerantut', 'temerloh', 'maran', 'bera', 'chenor', 'jengka'].contains(place)) {
    return 'PHG03';
  } else if (['bentong', 'lipis', 'raub'].contains(place)) {
    return 'PHG04';
  } else if (['genting sempah', 'janda baik', 'bukit tinggi'].contains(place)) {
    return 'PHG05';
  } else if (['cameron highlands', 'genting highlands', 'bukit fraser'].contains(place)) {
    return 'PHG06';
  }

  // Perak
  else if (['tapah', 'slim river', 'tanjung malim'].contains(place)) {
    return 'PRK01';
  } else if (['kuala kangsar', 'sg siput', 'ipoh', 'batu gajah', 'kampar'].contains(place)) {
    return 'PRK02';
  } else if (['lenggong', 'pengkalan hulu', 'grik'].contains(place)) {
    return 'PRK03';
  } else if (['temengor', 'belum'].contains(place)) {
    return 'PRK04';
  } else if (['kg gajah', 'teluk intan', 'bagan datuk', 'seri iskandar', 'beruas', 'parit', 'lumut', 'sitiawan', 'pulau pangkor'].contains(place)) {
    return 'PRK05';
  } else if (['selama', 'taiping', 'bagan serai', 'parit buntar'].contains(place)) {
    return 'PRK06';
  } else if (['bukit larut'].contains(place)) {
    return 'PRK07';
  }

  // Perlis
  else if (['seluruh negeri perlis'].contains(place)) {
    return 'PLS01';
  }

  // Pulau Pinang
  else if (['seluruh negeri pulau pinang'].contains(place)) {
    return 'PNG01';
  }

  // Sabah
  else if (['bahagian sandakan (timur)', 'bukit garam', 'semawang', 'temanggong', 'tambisan', 'bandar sandakan', 'sukau'].contains(place)) {
    return 'SBH01';
  } else if (['beluran', 'telupid', 'pinangah', 'terusan', 'kuamut', 'bahagian sandakan (barat)'].contains(place)) {
    return 'SBH02';
  } else if (['lahad datu', 'silabukan', 'kunak', 'sahabat', 'semporna', 'tungku', 'bahagian tawau (timur)'].contains(place)) {
    return 'SBH03';
  } else if (['bandar tawau', 'balong', 'merotai', 'kalabakan', 'bahagian tawau (barat)'].contains(place)) {
    return 'SBH04';
  } else if (['kudat', 'kota marudu', 'pitas', 'pulau banggi', 'bahagian kudat'].contains(place)) {
    return 'SBH05';
  } else if (['gunung kinabalu'].contains(place)) {
    return 'SBH06';
  } else if (['kota kinabalu', 'ranau', 'kota belud', 'tuaran', 'penampang', 'papar', 'putatan', 'bahagian pantai barat'].contains(place)) {
    return 'SBH07';
  } else if (['pensiangan', 'keningau', 'tambunan', 'nabawan', 'bahagian pendalaman (atas)'].contains(place)) {
    return 'SBH08';
  } else if (['beaufort', 'kuala penyu', 'sipitang', 'tenom', 'long pasia', 'membakut', 'weston', 'bahagian pendalaman (bawah)'].contains(place)) {
    return 'SBH09';
  }

  // Sarawak
  else if (['limbang', 'lawas', 'sundar', 'trusan'].contains(place)) {
    return 'SWK01';
  } else if (['miri', 'niah', 'bekenu', 'sibuti', 'marudi'].contains(place)) {
    return 'SWK02';
  } else if (['pandan', 'belaga', 'suai', 'tatau', 'sebauh', 'bintulu'].contains(place)) {
    return 'SWK03';
  } else if (['sibu', 'mukah', 'dalat', 'song', 'igan', 'oya', 'balingian', 'kanowit', 'kapit'].contains(place)) {
    return 'SWK04';
  } else if (['sarikei', 'matu', 'julau', 'rajang', 'daro', 'bintangor', 'belawai'].contains(place)) {
    return 'SWK05';
  } else if (['lubok antu', 'sri aman', 'roban', 'debak', 'kabong', 'lingga', 'engkelili', 'betong', 'spaoh', 'pusa', 'saratok'].contains(place)) {
    return 'SWK06';
  } else if (['serian', 'simunjan', 'samarahan', 'sebuyau', 'meludam'].contains(place)) {
    return 'SWK07';
  } else if (['kuching', 'bau', 'lundu', 'sematan'].contains(place)) {
    return 'SWK08';
  } else if (['zon khas (kampung patarikan)'].contains(place)) {
    return 'SWK09';
  }

  // Selangor
  else if (['gombak', 'petaling', 'sepang', 'hulu langat', 'hulu selangor', 'shah alam'].contains(place)) {
    return 'SGR01';
  } else if (['kuala selangor', 'sabak bernam'].contains(place)) {
    return 'SGR02';
  } else if (['klang', 'kuala langat'].contains(place)) {
    return 'SGR03';
  }

  // Terengganu
  else if (['kuala terengganu', 'marang', 'kuala nerus'].contains(place)) {
    return 'TRG01';
  } else if (['besut', 'setiu'].contains(place)) {
    return 'TRG02';
  } else if (['hulu terengganu'].contains(place)) {
    return 'TRG03';
  } else if (['dungun', 'kemaman'].contains(place)) {
    return 'TRG04';
  }

  // Wilayah Persekutuan
  else if (['kuala lumpur', 'putrajaya'].contains(place)) {
    return 'WLY01';
  } else if (['labuan'].contains(place)) {
    return 'WLY02';
  }

  // Default case if no match
  return 'WLY01';
}
