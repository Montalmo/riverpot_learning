import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterModel extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    notifyListeners();
  }
}

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void incrementCounter() {
    state++;
  }

  void decrementCounter() {
    state--;
  }
}

final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(() {
  return CounterNotifier();
});

final counterModelProvider = ChangeNotifierProvider<CounterModel>((ref) {
  return CounterModel();
});
