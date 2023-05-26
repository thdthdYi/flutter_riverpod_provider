import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_provider/provider/selectprovider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    //특정값이 변할 때만 build하고 싶을 때 .select 사용
    final state = ref.watch(selectProvider.select((value) => value.hasBought));
    //특정값이 변할 때만 listen하고 싶을 때 .select 사용 > 불필요한 액션들을 줄이면서 최적화.
    ref.listen(selectProvider.select((value) => value.hasBought),
        (previous, next) {
      print('next:$next');
    });

    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'SelectProviderScreen',
      )),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.toString()),
            // Text(state.name),
            // Text(state.hasBought.toString()),
            // Text(state.quantity.toString()),
            ElevatedButton(
                onPressed: () {
                  ref.read(selectProvider.notifier).ToggleHasBought();
                },
                child: const Text('bought Toggle'))
          ],
        ),
      ),
    );
  }
}
