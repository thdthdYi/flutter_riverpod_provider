import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_provider/provider/statenotifierprovider.dart';

//provider안에 쓸 때는 watch를 씀
final filteredItemList = Provider((ref) {
  final filterState = ref.watch(filterProvider);
  final itemListState = ref.watch(listProvider);

  if (filterState == FilterState.all) {
    return itemListState;
  }

  return itemListState.where(
      (e) => filterState == FilterState.cheap ? e.hasBought : !e.hasBought);
});

enum FilterState { expensive, all, cheap }

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
