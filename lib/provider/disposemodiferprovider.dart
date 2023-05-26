import 'package:flutter_riverpod/flutter_riverpod.dart';

//자동으로 캐시 삭제
final autoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));

  return [1, 2, 3, 4, 5];
});
