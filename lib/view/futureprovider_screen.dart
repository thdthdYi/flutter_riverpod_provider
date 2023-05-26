import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_provider/provider/futureprovider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //provider 가져오기
    final state = ref.watch(multipleasFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProviderScreen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          state.when(
              data: (data) {
                return Text(
                  data.toString(),
                  textAlign: TextAlign.center,
                );
              },
              error: (err, stack) => Text(err.toString()),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))
        ],
      ),
    );
  }
}
