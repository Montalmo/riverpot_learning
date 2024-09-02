import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/user_notifier.dart';

class UserFilterScreen extends ConsumerWidget {
  const UserFilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('Buil method id called');

    final user = ref.watch(userProvider.select((value) => value.name));

    return Scaffold(
      appBar: AppBar(
        title: const Text('User filter'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) {
                ref.read(userProvider.notifier).updateName(value);
              },
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              onSubmitted: (value) {
                ref.read(userProvider.notifier).updateAdress(value);
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(user),
          ],
        ),
      ),
    );
  }
}
