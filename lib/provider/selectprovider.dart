import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_provider/model/itemmodel.dart';

//notifier의 타입, notifier에서 다루는 상태 타입
final selectProvider =
    StateNotifierProvider<SelectNotifier, ItemModel>((ref) => SelectNotifier());

class SelectNotifier extends StateNotifier<ItemModel> {
  SelectNotifier()
      : super(
          ItemModel(name: '김치', quantity: 2, hasBought: false),
        );

  ToggleHasBought() {
    state = state.copyWith(hasBought: !state.hasBought);
  }
}
