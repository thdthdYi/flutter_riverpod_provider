//future 타입만 반환 가능
//api 요청 결과를 반환할 때 사용
//1회성 사용 > 반복적인 행동이 필요하면 statenotifier로 돌아가야 함

import 'package:flutter_riverpod/flutter_riverpod.dart';

final multipleasFutureProvider = FutureProvider<List<int>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));

  return [1, 2, 3, 4, 5];
});
