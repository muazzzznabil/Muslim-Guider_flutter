//
// import 'dart:convert';
// import 'package:http/http.dart';
// import 'package:riverpod/riverpod.dart';
// import '../model/mosque_model.dart';
//
// class Mosquelocatorapi {
//   String endpoint = 'https://masjid.onrender.com/near_by_mosque?coordinate=3.140853,101.693207&accuracy=0.04';
//
//   Future<List<Mosquelocator>> getMosque() async {
//     Response response = await get(Uri.parse(endpoint));
//
//     //Check response
//     if (response.statusCode == 200) {
//       final List result = jsonDecode(response.body)['name'];//test
//       return result.map(((e) => Mosquelocator.fromJson(e))).toList();
//     } else {
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }
//   //Create provider to share data
//   final mosqueProvider = Provider<Mosquelocatorapi>((ref)=>Mosquelocatorapi());
import 'dart:convert';
import 'package:http/http.dart';
import 'package:riverpod/riverpod.dart';
import '../model/mosque_model.dart';

class MosqueLocatorApi {
   String lat = '5.2997049';
   String long = '103.1370079';
  String accuracy = '0.01';

  Future<List<MosqueLocator>> getMosques() async {
    final String endpoint = 'https://masjid.onrender.com/near_by_mosque?coordinate=$lat,$long&accuracy=$accuracy';
    Response response = await get(Uri.parse(endpoint));
    print('SHOUDL IN HERE---------------------------------');
    // Check response status
    if (response.statusCode == 200) {
      print('SUCESS_--------------------------------------------');
      // Assuming the API returns a JSON array of mosque objects
      final List<dynamic> result = jsonDecode(response.body);
      return result.map((e) => MosqueLocator.fromJson(e)).toList();
    } else {
      print('errorrrrr');
      throw Exception(response.reasonPhrase);
    }
  }
}

// Create provider to share data
final mosque_Provider = Provider<MosqueLocatorApi>((ref) => MosqueLocatorApi());

