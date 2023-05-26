import 'package:flutter/material.dart';
import 'package:flutter_riverpod_provider/view/statenotifierprovider_screen.dart';
import 'package:flutter_riverpod_provider/view/streamprovider_screen.dart';

import 'futureprovider_screen.dart';
import 'stateprovider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpob Provider'),
      ),
      body: ListView(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const StateProviderScreen(),
                  ),
                );
              },
              child: const Text("StateProvider"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const StateNotifierProviderScreen(),
                  ),
                );
              },
              child: const Text("StateNotifierProvider"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const FutureProviderScreen(),
                  ),
                );
              },
              child: const Text("FutureProvider"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const StreamProviderScreen(),
                  ),
                );
              },
              child: const Text("StreamProvider"),
            ),
          ),
        ],
      ),
    );
  }
}
