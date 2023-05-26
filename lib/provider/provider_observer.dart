import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  //하위에 있는 provider가 업데이트 되면 해당 함수가 호출됌.
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    print(
        '[Provider Updated] provider : $provider / pv : $previousValue / nv : $newValue');
  }

//provider를 추가하면 불리는 함수
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    print('[Provider Add] provider : $provider / pv : $value ');
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    print('[Provider Dispose] provider : $provider');
  }
}
