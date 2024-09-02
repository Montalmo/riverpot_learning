import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Color> colors = [
  Colors.blue,
  Colors.redAccent,
  Colors.greenAccent,
];

enum ColorsAction { added, deleted, none }

class ColorsState {
  final List<Color> favoriteColorsList;

  ColorsState({required this.favoriteColorsList, required this.colorsAction});

  ColorsAction colorsAction;

  factory ColorsState.initial() {
    return ColorsState(favoriteColorsList: [], colorsAction: ColorsAction.none);
  }

  ColorsState copyWith({
    List<Color>? favoriteColorsList,
    ColorsAction? colorsAction,
  }) {
    return ColorsState(
        favoriteColorsList: favoriteColorsList ?? this.favoriteColorsList,
        colorsAction: colorsAction ?? this.colorsAction);
  }
}

class ColorStateController extends StateNotifier<ColorsState> {
  ColorStateController() : super(ColorsState.initial()) {
    _init();
  }

  void _init() async {
    state = state.copyWith(
        favoriteColorsList: colors, colorsAction: ColorsAction.none);
  }

  void removeColor(Color color) {
    final list = state.favoriteColorsList;
    list.remove(color);
    state = state.copyWith(
      favoriteColorsList: list,
      colorsAction: ColorsAction.deleted,
    );
  }

  void addColor() {
    final list = state.favoriteColorsList;
    list.add(Colors.lightGreen);
    state = state.copyWith(
      favoriteColorsList: list,
      colorsAction: ColorsAction.added,
    );
  }
}

class ColorChangeRepository extends ChangeNotifier {
  final listColors = colors;

  void removeColor(Color color) {
    listColors.remove(color);
    notifyListeners();
  }

  void addColor(Color color) {
    listColors.add(color);
    notifyListeners();
  }
}

final colorStateControllerStateProvider =
    StateNotifierProvider<ColorStateController, ColorsState>((ref) {
  return ColorStateController();
});

final coloRepositoryChangeNotifierProvider =
    ChangeNotifierProvider.autoDispose<ColorChangeRepository>((ref) {
  return ColorChangeRepository();
});
