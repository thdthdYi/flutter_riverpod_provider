import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/stateprovider.dart';

//riverpod 상태변화 감지를 사용하기 위해 ConsumerWidget으로 변경
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

//ConsumerWidget은 ref를 받는다.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //getX controller 가져오는 것과 같다고 보면 됌.
    final provider = ref.watch(numberProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.toString()),
            ElevatedButton(
              onPressed: () {
                //버튼이 실행될 때는 read를 사용.
                //값을 바꾸고 싶을 때는 notifier 붙여줌
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: const Text("Up"),
            ),
            ElevatedButton(
              onPressed: () {
                //state에 -1을 한 후에 해당 버튼에 해당하는 state에 덮어씌워줌
                ref.read(numberProvider.notifier).state = ref
                    .read(numberProvider.notifier)
                    .update((state) => state - 1);
              },
              child: const Text("Down"),
            )
          ],
        ),
      ),
    );
  }
}
