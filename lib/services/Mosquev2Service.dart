import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:muslim_guider_v1/model/mosquev2_model.dart';
import 'package:riverpod/riverpod.dart';
import '../model/mosque_model.dart';
import 'geolocator.dart';
import 'package:muslim_guider_v1/services/geolocator.dart';

class Mosquev2service{

  final _geolocator = geolocatorFinder();

  Future<List<MosqueV2>> getMosques() async{

    Position position = await _geolocator.getCurrentPosition();

    String lat = position.latitude.toString();
    String long = position.latitude.toString();

    //String lat = '5.2997049';
    //String long = '103.1370079';
    String key = 'pk.eyJ1IjoibXVhem5hYmlsIiwiYSI6ImNtMDltNXB0czA2YW4ya3B2OHU3b2NheDQifQ.t7Xf0hSVv4uJ8yuhCdcYYA';

    final String mapBox = 'https://api.mapbox.com/geocoding/v5/mapbox.places/mosque.json?proximity=$long,$lat&access_token=$key';
    final String foursq = '';
    Response response = await get(Uri.parse(mapBox));
    print('SHOUDL IN HERE---------------------------------');
    // Check response status
    if (response.statusCode == 200) {
      print('SUCCESS_--------------------------------------------');
      // Assuming the API returns a JSON array of mosque objects
      final List<dynamic> result = jsonDecode(response.body)['features'];
      return result.map((e) => MosqueV2.fromJson(e)).toList();
    } else {
      print('errorrrrr');
      throw Exception(response.reasonPhrase);
    }
  }

  String getMap(){
    String name = '';


    return name;
  }


}

// Create provider to share data
final mosque_ProviderV2 = Provider<Mosquev2service>((ref) => Mosquev2service());