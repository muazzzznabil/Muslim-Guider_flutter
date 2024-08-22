
import 'dart:convert';
import 'package:http/http.dart';
import 'package:riverpod/riverpod.dart';
import '../model/mosque_model.dart';

class Mosquelocatorapi {
  String endpoint = 'https://masjid.onrender.com/near_by_mosque?coordinate=3.140853,101.693207&accuracy=0.04';

  Future<List<Mosquelocator>> getMosque() async {
    Response response = await get(Uri.parse(endpoint));

    //Check response
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['name'];//test
      return result.map(((e) => Mosquelocator.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
  //Create provider to share data
  final mosqueProvider = Provider<Mosquelocatorapi>((ref)=>Mosquelocatorapi());












