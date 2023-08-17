import 'package:bookclub/ui/pages/book_details/book_details_page.dart';
import 'package:bookclub/ui/pages/home/home_page.dart';
import 'package:bookclub/ui/pages/writer_details/writer_details_page.dart';
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
            path: RouterPaths.bookDetailsPath,
            builder: (BuildContext context, GoRouterState state) {
              return const DetailsPage();
            },
          ),
          GoRoute(
            path: RouterPaths.writeDetailsPath,
            builder: (BuildContext context, GoRouterState state) {
              int userId = int.parse(state.pathParameters['id']!);
              return WriterDetailsPage(userId: userId);
            },
          ),
        ]),
  ],
);

class RouterPaths {
  static String writeDetailsPath = 'writer/:id/details';
  static String bookDetailsPath = 'book/:id/details';

  static getWriterDetailsPath(int userId) {
    return '/writer/$userId/details';
  }

  static getBookDetailsPath(int bookId) {
    return '/book/$bookId/details';
  }
}
