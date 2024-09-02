import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/color_tem_widget.dart';
import 'package:riverpod_learning/colors.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(colorStateControllerStateProvider, (_, state) {
      if (state.colorsAction == ColorsAction.added) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Color has been added to favorites',
          style: TextStyle(color: Colors.green),
        )));
      } else if (state.colorsAction == ColorsAction.deleted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Color has been deleted of favorites',
          style: TextStyle(color: Colors.red),
        )));
      }
    });

    final colorList =
        ref.watch(colorStateControllerStateProvider).favoriteColorsList;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(colorStateControllerStateProvider);
              },
              icon: const Icon(Icons.refresh)),
        ],
        title: const Text('Favorites'),
      ),
      body: ListView(
        children:
            colorList.map((element) => ColorItem(color: element)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(colorStateControllerStateProvider.notifier).addColor();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
