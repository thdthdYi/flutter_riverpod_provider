import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_provider/provider/codegenerationprovider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(number1: 10, number2: 20));

    return Scaffold(
        appBar: AppBar(
          title: Text("Codegeneration"),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$state1'),
              state2.when(
                  data: (data) {
                    return Text('$data');
                  },
                  error: (error, stack) => Text(error.toString()),
                  loading: () => CircularProgressIndicator()),
              state3.when(
                  data: (data) {
                    return Text('$data');
                  },
                  error: (error, stack) => Text(error.toString()),
                  loading: () => CircularProgressIndicator()),
              Text('$state4'),
              //Consumer 위젯만 빌더 가능.
              //부분 랜더링을 활용하기 위한 방법
              Consumer(
                builder: (context, ref, child) {
                  final state5 = ref.watch(gStateNotifierProvider);
                  return Row(
                    children: [
                      Text('$state5'),
                      //Consumer 위젯이 재빌드 되어도 child 위젯은 빌드 되지 않음.
                      if (child != null) child,
                    ],
                  );
                },
                child: Text('hello'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ref.read(gStateNotifierProvider.notifier).increment();
                      },
                      child: Text('++')),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(gStateNotifierProvider.notifier).decrement();
                      },
                      child: Text('--')),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    //초기화 상태로 돌아감
                    //invalidate 함수 기억하기.
                    ref.invalidate(gStateNotifierProvider);
                  },
                  child: Text('Invalidate'))
            ],
          ),
        ));
  }
}

class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);

    return Text('$state5');
  }
}
