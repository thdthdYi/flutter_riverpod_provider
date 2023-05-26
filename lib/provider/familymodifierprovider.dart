//family / autoDispose

import 'package:flutter_riverpod/flutter_riverpod.dart';

//family는 받는 데이터를 넣어줘야함.
//data를 3으로 받으면 index와 곱해짐.
//provider를 생성하는 순간 데이터로 로직을 변경해줘야할 때 사용.
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(const Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});
