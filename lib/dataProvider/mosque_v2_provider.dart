import 'package:muslim_guider_v1/model/mosquev2_model.dart';
import 'package:muslim_guider_v1/services/Mosquev2Service.dart';

import 'package:riverpod/riverpod.dart';

final mosqueDataProviderV2 = FutureProvider<List<MosqueV2>>((ref) async{
  print('-------------------------------------------------');
  return ref.watch(mosque_ProviderV2).getMosques();
});

