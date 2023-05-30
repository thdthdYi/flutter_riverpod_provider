import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'codegenerationprovider.g.dart';

//1) 어떤 provider를 사용할지 고민할 필요 없도록

final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation';
}

//2) Parameter > Family 파라미터를 일반 함수처럼 사용할 수 있도록 해결.

@riverpod //AutoDisposeProvider
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

@Riverpod(
  //대문자는 FutureProvider
  //값을 살려둘 것
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

// 2) Parameter > family 일반 함수처럼 사용하기

class Parameter {
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}

final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, parameter) => parameter.number1 * parameter.number2,
);

@riverpod
int gStateMultiply(GStateMultiplyref,
    {required int number1, required int number2}) {
  return number1 * number2;
}

@riverpod
class GStateNotifier extends _$GStateNotifier {
  @override
  int build() {
    return 0;
  }

  increment() {
    state++;
  }

  decrement() {
    state--;
  }
}
