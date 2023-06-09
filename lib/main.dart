import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_provider/provider/provider_observer.dart';
import 'package:flutter_riverpod_provider/view/homescreen.dart';

void main() {
  //ProviderScope : riverpod 라이브러리를 사용하기 위해 main 상단에 선언
  //하위 위젯들이 provider객체에 접근할 수 있음
  runApp(ProviderScope(observers: [Logger()], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
