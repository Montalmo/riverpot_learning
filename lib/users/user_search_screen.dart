import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_learning/users/user_model.dart';
import 'package:riverpod_learning/users/users_data_controller.dart';

class UserSearchScreen extends ConsumerWidget {
  const UserSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersList = ref.watch(usersDataControllerProvider);

    return Scaffold(
        appBar: AppBar(title: const Text('Prod filter Screen')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  ref
                      .read(usersDataControllerProvider.notifier)
                      .searchUser(value);
                },
                decoration: const InputDecoration(
                  labelText: 'Search by Name',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              usersList.currentList.when(
                  data: (currentList) => AppUsersList(appUserList: currentList),
                  error: (error, st) => ErrorWidget(error),
                  loading: () => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Users lis is liading ...',
                        ),
                      ))
            ],
          ),
        ));
  }
}

class AppUsersList extends StatelessWidget {
  const AppUsersList({
    super.key,
    required this.appUserList,
  });

  final List<UserModel> appUserList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: appUserList.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                appUserList[index].avatar!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          subtitle: Text(appUserList[index].firstName!),
          title: Text(
            appUserList[index].lastName!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
