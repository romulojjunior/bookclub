import 'package:bookclub/ui/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/widgets.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage(title: 'Home Page');
      },
    ),
  ],
);
