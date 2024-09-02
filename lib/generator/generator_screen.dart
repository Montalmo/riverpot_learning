import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'generator_screen.g.dart';

class GeneratorScreen extends ConsumerWidget {
  const GeneratorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod generator'),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}

// final nameProvider = Provider<String>((ref) => 'Amar');

@riverpod
String name(NameRef ref) {
  return 'Andrey';
}
