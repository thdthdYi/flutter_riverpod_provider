import 'package:flutter/material.dart';

import 'stateprovider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }
}
