import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/api_service.dart';


class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: usersData.when(
          data: (data) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text('${data[index].firstName} ${data[index].lastName}'),
                  subtitle: Text('${data[index].email}'),
                  leading: CircleAvatar(
                    child:
                        ClipOval(child: Image.network('${data[index].avatar}')),
                  ),
                );
              },
              itemCount: data.length,
            );
          },
          error: (error, st) => ErrorWidget(Text(error.toString())),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
