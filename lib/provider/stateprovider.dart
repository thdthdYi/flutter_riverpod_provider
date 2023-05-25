//String, int 등 basic type만 다룸 (ex) number ++;)
//class와 같은 복잡한 type은 다루지 않는다.

//ref.watch 반환값의 업데이트가 있을 때 지속적으로 build 함수 재실행 - ui 관련 코드에만 사용
//ref.read 실행되는 순간 단 한번만 provider값을 가져옴 > 버튼을 눌렀을 때만 실행

import 'package:flutter_riverpod/flutter_riverpod.dart';

//상태 관리가 필요한 provider 선언
final numberProvider = StateProvider<int>((ref) => 0);
