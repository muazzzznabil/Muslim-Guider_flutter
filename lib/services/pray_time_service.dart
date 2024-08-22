import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:muslim_guider_v1/model/waktuSolat_model.dart';

class prayTimeApi{

  double lat = 5.299666;
  double lng = 103.1370183;

  Future<List<waktuSolatModel>> getWaktuSolat() async{
    Response response = await get(Uri.parse('https://api.waktusolat.app/v2/solat/gps/$lat/$lng'));
    if(response.statusCode == 200){
      final List waktuSolat = jsonDecode(response.body)['prayers'];
      return waktuSolat.map(((e) => waktuSolatModel.fromJson(e))).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}

final waktuSolat_Provider = Provider<prayTimeApi>((ref)=>prayTimeApi());