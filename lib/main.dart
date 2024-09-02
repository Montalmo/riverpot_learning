import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_learning/countre_demo.dart';
import 'package:riverpod_learning/routers.dart';

final themeProvider = StateProvider<bool>((ref) => true);

final couterStateNotifierProvider =
    StateNotifierProvider.autoDispose<CounterDemo, int>((ref) {
  return CounterDemo();
});

final streamProvider = StreamProvider.autoDispose<int>((ref) {
  return Stream.periodic(
      const Duration(seconds: 1), (computationCount) => computationCount);
});

final counterProvider = StateProvider.autoDispose<int>((ref) => 0);

final nameProvider = Provider.autoDispose<String>((ref) => 'Hello Andrey!');

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
      theme: isLightTheme ? ThemeData.light() : ThemeData.dark(),
    );
  }
}

