import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/colors.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: ListTile(
        title: const Text('Some color'),
        trailing: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return IconButton(
                onPressed: () {
                  // ref
                  //     .read(coloRepositoryStateNotifierProvider.notifier)
                  //     .removeColor(color);
                  // ref
                  //     .read(coloRepositoryChangeNotifierProvider)
                  //     .removeColor(color);
                  ref
                      .read(colorStateControllerStateProvider.notifier)
                      .removeColor(color);
                },
                icon: const Icon(Icons.delete_outline));
          },
        ),
        leading: CircleAvatar(
          radius: 64.0,
          backgroundColor: color,
        ),
      ),
    );
  }
}
