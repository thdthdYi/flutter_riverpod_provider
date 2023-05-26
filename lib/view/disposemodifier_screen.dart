import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_provider/provider/disposemodiferprovider.dart';

class AutodisposeModifierScreen extends ConsumerWidget {
  const AutodisposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DisiposeModifierScreen'),
      ),
      body: Center(
          child: state.when(
              data: (data) => Text(data.toString()),
              error: (err, stack) => Text(err.toString()),
              loading: () => const CircularProgressIndicator())),
    );
  }
}
