import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_learning/common_widgets.dart';
import 'package:riverpod_learning/home/messages_page.dart';
import 'package:riverpod_learning/home/notofication_page.dart';
import 'package:riverpod_learning/main.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(couterStateNotifierProvider, ((previos, next) {
      if (next == 10) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('The value is $next')));
      }
    }));

    final currenPageIndex = ref.watch(navigationBarStateProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(couterStateNotifierProvider);
                ref.invalidate(streamProvider);
              },
              icon: const Icon(Icons.refresh)),
        ],
        title: const Row(
          children: [
            Text('Riverpod learning'),
            SizedBox(
              width: 8.0,
            ),
            StreamCounter(),
          ],
        ),
      ),
      body: [
        const HomePage(),
        const NotoficationPage(),
        const MessagesPage(),
      ][currenPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currenPageIndex,
        onDestinationSelected: (value) =>
            ref.read(navigationBarStateProvider.notifier).state = value,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notification_add_sharp),
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('7'),
              child: Icon(Icons.message),
            ),
            label: 'Messages',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(couterStateNotifierProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

final navigationBarStateProvider = StateProvider<int>((ref) => 0);

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomwPageState();
}

class _HomwPageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    final counter = ref.watch(couterStateNotifierProvider);
    final isLightTheme = ref.watch(themeProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '$counter',
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
              onPressed: () {
                context.push('/favorites');
              },
              child: const Text('Go to the Favorites page')),
          const SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
              onPressed: () {
                context.push('/users');
              },
              child: const Text('Go to the Users page')),
          const SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
              onPressed: () {
                context.push('/filter');
              },
              child: const Text('Go to the User filter page')),
          const SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
              onPressed: () {
                context.push('/generator');
              },
              child: const Text('Go to the Generator')),
          const SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
              onPressed: () {
                context.push('/notifiercounter');
              },
              child: const Text('Go to the Counter')),
          const SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
              onPressed: () {
                context.push('/produsersfilter');
              },
              child: const Text('Go to the Prod Users filter')),
          const SizedBox(
            height: 8.0,
          ),
          Switch(
              value: isLightTheme,
              onChanged: (value) {
                ref.read(themeProvider.notifier).state = value;
              })
        ],
      ),
    );
  }
}
