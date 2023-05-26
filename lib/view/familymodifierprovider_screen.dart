import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_provider/provider/familymodifierprovider.dart';

class FamilyModifierProviderScreen extends ConsumerWidget {
  const FamilyModifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(familyModifierProvider(3));
    return Scaffold(
        appBar: AppBar(
          title: const Text('FamilyModifierScreen'),
        ),
        body: Center(
          child: state.when(
              data: (data) => Text(data.toString()),
              error: (err, stack) => Text(err.toString()),
              loading: () => const CircularProgressIndicator()),
        ));
  }
}
