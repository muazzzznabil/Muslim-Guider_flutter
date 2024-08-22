import 'package:muslim_guider_v1/model/mosque_model.dart';
import 'package:muslim_guider_v1/pages/mosqueLocator.dart';
import 'package:muslim_guider_v1/services/mosqueLocatorAPI.dart';

import 'package:riverpod/riverpod.dart';

final mosqueDataProvider = FutureProvider<List<MosqueLocator>>((ref) async{
  return ref.watch(mosque_Provider).getMosques();
});

