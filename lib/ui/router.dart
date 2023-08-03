import 'package:bookclub/ui/pages/details/details_page.dart';
import 'package:bookclub/ui/pages/home/home_page.dart';
import 'package:bookclub/ui/pages/profile/profile_page.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/widgets.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage(title: 'Home Page');
        },
        routes: [
          GoRoute(
            path: 'photos/:id',
            builder: (BuildContext context, GoRouterState state) {
              return const DetailsPage();
            },
          ),
          GoRoute(
            path: 'profiles/:id',
            builder: (BuildContext context, GoRouterState state) {
              int userId = int.parse(state.pathParameters['id']!);
              return ProfilePage(userId: userId);
            },
          ),
        ]),
  ],
);
