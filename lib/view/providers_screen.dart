import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_provider/provider/providers.dart';

import '../provider/statenotifierprovider.dart';

class ProvidersScreen extends ConsumerWidget {
  const ProvidersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredItemList);

    print(state);

    return Scaffold(
        appBar: AppBar(
          title: Text('Providers Screen'),
          actions: [
            PopupMenuButton(
              itemBuilder: (_) =>
                  FilterState.values //FilterState의 모든 값을 가져올 수 있음
                      .map((e) => PopupMenuItem(
                            child: Text(e.name),
                            value: e,
                          ))
                      .toList(),
              onSelected: (value) {
                ref.read(filterProvider.notifier).update((state) => value);
              },
            ),
          ],
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
        ));
  }
}
