import 'package:muslim_guider_v1/model/mosque_model.dart';
import 'package:muslim_guider_v1/services/mosqueLocatorAPI.dart';

import 'package:riverpod/riverpod.dart';

final mosqueDataProvider = FutureProvider<List<Mosquelocator>>((ref) async{
  return ref.watch(mosqueProvider).getMosque();
});

