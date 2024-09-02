import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/counter/counter_model.dart';

class NotifierCounterScreen extends ConsumerWidget {
  const NotifierCounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final value = ref.watch(counterModelProvider).counter;
    final counterValue = ref.watch(counterNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifier counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              // value.toString(),
              counterValue.toString(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.lightGreenAccent,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      ref
                          .read(counterNotifierProvider.notifier)
                          .decrementCounter();
                      // ref.read(counterModelProvider).decrementCounter();
                    },
                    label: const Icon(Icons.remove)),
                const SizedBox(
                  width: 16.0,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      // ref.read(counterModelProvider).incrementCounter();
                      ref
                          .read(counterNotifierProvider.notifier)
                          .incrementCounter();
                    },
                    label: const Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
