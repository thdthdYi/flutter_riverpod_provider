import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/listenprovider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(
        length: 10,
        vsync: this,
        //화면을 나갔다와도 멈췄던 숫자를 보여줌
        initialIndex: ref.read(listenProvider));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(listenProvider, (previous, next) {
      if (previous != next) {
        controller.animateTo(next);
      }
      // ignore: avoid_print
      print(previous);
      // ignore: avoid_print
      print(next);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListenProvider'),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(
            10,
            (index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(index.toString()),
                    ElevatedButton(
                        onPressed: () {
                          ref
                              .read(listenProvider.notifier)
                              .update((state) => state == 10 ? 10 : state + 1);
                        },
                        child: const Text('다음')),
                    Text(index.toString()),
                    ElevatedButton(
                        onPressed: () {
                          ref
                              .read(listenProvider.notifier)
                              .update((state) => state == 0 ? 0 : state - 1);
                        },
                        child: const Text('뒤로'))
                  ],
                )),
      ),
    );
  }
}
