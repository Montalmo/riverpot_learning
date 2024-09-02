import 'package:go_router/go_router.dart';

import 'package:riverpod_learning/counter/notifier_counter_screen.dart';
import 'package:riverpod_learning/favorites_screen.dart';
import 'package:riverpod_learning/generator/generator_screen.dart';
import 'package:riverpod_learning/home/home_page.dart';
import 'package:riverpod_learning/user_filter_page.dart';
import 'package:riverpod_learning/users/user_search_screen.dart';
import 'package:riverpod_learning/users_screen.dart';

final routes = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Home(), routes: [
      GoRoute(
        name: 'Favorites',
        path: 'favorites',
        builder: (context, state) => const FavoritesScreen(),
      ),
      GoRoute(
        path: 'users',
        name: 'Users screen',
        builder: (context, state) => const UsersScreen(),
      ),
      GoRoute(
        path: 'filter',
        name: 'Users filter screen',
        builder: (context, state) => const UserFilterScreen(),
      ),
      GoRoute(
        path: 'generator',
        name: 'Riverpod generator',
        builder: (context, state) => const GeneratorScreen(),
      ),
      GoRoute(
        path: 'notifiercounter',
        name: 'Notifier counter page',
        builder: (context, state) => const NotifierCounterScreen(),
      ),
      GoRoute(
        path: 'produsersfilter',
        name: 'Prod filter page',
        builder: (context, state) => const UserSearchScreen(),
      ),
    ]),
  ],
);
