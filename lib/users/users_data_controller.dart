import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/users/get_user_api.dart';
import 'package:riverpod_learning/users/user_model.dart';

class UsersState {
  final AsyncValue<List<UserModel>> currentList;
  final List<UserModel> searchList;

  UsersState({required this.currentList, required this.searchList});

  factory UsersState.initial() {
    return UsersState(currentList: const AsyncValue.data([]), searchList: []);
  }

  UsersState copyWith({
    AsyncValue<List<UserModel>>? currentList,
    List<UserModel>? searchList,
  }) {
    return UsersState(
      currentList: currentList ?? this.currentList,
      searchList: searchList ?? this.searchList,
    );
  }
}

class UsersDataController extends StateNotifier<UsersState> {
  UsersDataController({required this.api}) : super(UsersState.initial()) {
    _init();
  }

  final GetUsersDataAPI api;

  void _init() async {
    state = state.copyWith(currentList: const AsyncValue.loading());
    final usersData = await api.fetchUsersData();
    state = state.copyWith(
        currentList: AsyncValue.data(usersData), searchList: usersData);
  }

  void searchUser(String userName) {
    final currentUsers = (state.currentList.value ?? [])
        .where((element) => element.firstName
            .toString()
            .toLowerCase()
            .contains(userName.toLowerCase()))
        .toList();
    state = state.copyWith(searchList: currentUsers);
  }
}



final usersDataControllerProvider =
    StateNotifierProvider.autoDispose<UsersDataController, UsersState>((ref) {
  return UsersDataController(api: ref.read(getUserDataAPIProvider));
});