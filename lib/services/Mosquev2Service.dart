import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:muslim_guider_v1/model/mosquev2_model.dart';
import 'package:riverpod/riverpod.dart';
import '../model/mosque_model.dart';
import 'package:muslim_guider_v1/services/geolocator.dart';


class Mosquev2service{

  final _geolocator = geolocatorFinder();

  Future<List<MosqueV2>> getMosques() async{

    Position position = await _geolocator.getCurrentPosition();

    String lat = position.latitude.toString();
    String long = position.longitude.toString();
    double latdis = double.parse(lat);
    double lngdis = double.parse(long);
    print('----------------------------------------------------------------------------------');
    print(lat);
    print(long);

    //String lat = '5.2997049';
    //String long = '103.1370079';
    String key = 'pk.eyJ1IjoibXVhem5hYmlsIiwiYSI6ImNtMDltNXB0czA2YW4ya3B2OHU3b2NheDQifQ.t7Xf0hSVv4uJ8yuhCdcYYA';

    final String mapBox = 'https://api.mapbox.com/geocoding/v5/mapbox.places/mosque.json?proximity=$long,$lat&access_token=$key';
    final String foursq = '';
    Response response = await get(Uri.parse(mapBox));
    print('SHOUDL IN HERE---------------------------------');
    // Check response status
    if (response.statusCode == 200) {
      print('SUCCESS--------------------------------------------');
      // Assuming the API returns a JSON array of mosque objects
      final List<dynamic> result = jsonDecode(response.body)['features'];
      // return result.map((e) => MosqueV2.fromJson(e)).toList();

      List<MosqueV2> mosques = result.map((e) => MosqueV2.fromJson(e)).toList();

      for (MosqueV2 mosque in mosques) {
        double distance = calculateDistance(latdis, lngdis, mosque.lat, mosque.lng);
        mosque.distance = distance; // Set distance
      }
      return mosques;

    } else {
      print('errorrrrr');
      throw Exception(response.reasonPhrase);
    }
  }

  double calculateDistance(double startLat, double startLong, double targetLat, double targetLong) {
    return Geolocator.distanceBetween(startLat, startLong, targetLat, targetLong);
  }

  String getMap(){
    String name = '';
    return name;
  }




}

// Create provider to share data
final mosque_ProviderV2 = Provider<Mosquev2service>((ref) => Mosquev2service());