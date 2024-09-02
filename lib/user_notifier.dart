import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/user.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void updateName(String value) {
    state = state.copyWith(name: value);
  }

  void updateAdress(String value) {
    state = state.copyWith(adress: value);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(const User(name: 'SomeOne', adress: 'Ukraine'));
});
