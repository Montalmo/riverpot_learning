import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/main.dart';

class StreamCounter extends ConsumerWidget {
  const StreamCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);
    return streamData.when(
        data: (data) => Text(data.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.redAccent)),
        error: (error, st) => ErrorWidget(error),
        loading: () => const CircularProgressIndicator());
  }
}
