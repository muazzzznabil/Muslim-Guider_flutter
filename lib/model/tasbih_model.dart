import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dataProvider/counter_provider.dart';

class TasbihRecord {
  final int goal;
  final int count;
  final DateTime date;

  TasbihRecord({
    required this.goal,
    required this.count,
    required this.date,
  });
}

