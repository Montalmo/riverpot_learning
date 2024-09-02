import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_learning/users/user_model.dart';

class ApiService {
  String endpoint = 'https://reqres.in/api/users?page=2';

  List<UserModel> _userGlobalList = [];

  Future<List<UserModel>> getUser() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['data'];
      _userGlobalList =
          results.map((element) => UserModel.fromJson(element)).toList();
      return _userGlobalList;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<UserModel>> getFiltredUser(String userName) async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['data'];
      return results
          .map((element) => UserModel.fromJson(element))
          .toList()
          .where((element) => element.firstName
              .toString()
              .toLowerCase()
              .contains(userName.toLowerCase()))
          .toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

class SortedUsersListController extends StateNotifier{
  SortedUsersListController(super.state);

}

final ipiProvider = Provider<ApiService>((ref) => ApiService());

final userDataProvider = FutureProvider.autoDispose<List<UserModel>>((ref) {
  final repository = ref.read(ipiProvider);
  return repository.getUser();
});


