//SteteNotifier을 상속한 class를 반환할 수 있음
//복잡한 형태의 데이터 관리 가능
//ui에서 직접적으로 데이터를 변경할 수 있음

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_provider/model/itemmodel.dart';

//Widget에서 사용하기 위해 provider을 만들어줘야함.
//선언하고자 하는 Notifier를 타입을 넣어주고, 해당 클래스가 관리하는 상태(class)를 넣어줌.
final listProvider = StateNotifierProvider<ListNotifier, List<ItemModel>>(
    (ref) => ListNotifier());

class ListNotifier extends StateNotifier<List<ItemModel>> {
  //StateNotifier에서는 class를 선언해준 후, 무조건 StateNotifier을 상속해야함.
  //StateNotifier에서는 받아야할 리스트를 무조건 선언.

//필수 선언 요소
//super - 초기값 선언
  ListNotifier()
      : super([
          ItemModel(name: '김치', quantity: 3, hasBought: true),
          ItemModel(name: '삼겹살', quantity: 2, hasBought: true),
          ItemModel(name: '햇반', quantity: 5, hasBought: false)
        ]);

  void toggleHasBought({required String name}) {
    //state는 name이 같으면 똑같이 list의 내용을 map을 넣어주고, 아닐 경우 e의 값을 넣어준다.
    state = state
        .map((e) => e.name == name
            ? ItemModel(
                name: e.name, quantity: e.quantity, hasBought: !e.hasBought)
            : e)
        .toList();
  }
}
