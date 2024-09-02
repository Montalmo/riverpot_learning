import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import 'package:riverpod_learning/users/user_model.dart';

class GetUsersDataAPI {
  String endpoint = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> fetchUsersData() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List responseResult = jsonDecode(response.body)['data'];
      return responseResult
          .map((element) => UserModel.fromJson(element))
          .toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final getUserDataAPIProvider = Provider<GetUsersDataAPI>((ref) {
  return GetUsersDataAPI();
});