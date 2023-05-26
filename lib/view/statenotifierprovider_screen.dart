import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_provider/model/itemmodel.dart';

import '../provider/statenotifierprovider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //관리하고자 하는 상태로 state를 선언 - ref.watch로 만든 provider 가져옴
    final List<ItemModel> state = ref.watch(listProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifier'),
      ),
      body: ListView(
        children: state
            .map(
              (e) => CheckboxListTile(
                  title: Text(e.name),
                  value: e.hasBought,
                  onChanged: (value) {
                    //단발적 사용 > ref.read
                    //notifier를 가지고 와야지만 update가 가능
                    //class안에 미리 정의해놓은 함수를 가지고 오는 것이기 때문에 함수사용
                    ref
                        .read(listProvider.notifier)
                        .toggleHasBought(name: e.name);
                  }),
            )
            .toList(),
      ),
    );
  }
}
