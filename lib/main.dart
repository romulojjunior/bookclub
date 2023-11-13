import 'package:bookclub/di/app_di.dart';
import 'package:bookclub/ui/router.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_bloc.dart';
import 'package:bookclub/ui/state/books_bloc/books_bloc.dart';
import 'package:bookclub/ui/state/favorites_cubit/favorites_cubit.dart';
import 'package:bookclub/ui/state/search_cubit/search_cubit.dart';
import 'package:bookclub/ui/state/settings_cubit/settings_cubit.dart';
import 'package:bookclub/ui/theme/app_theme.dart';
import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:flutter/cupertino.dart' as ios;
import 'package:flutter/material.dart' as android;
import 'package:flutter/widgets.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

void main() {
  loadAppDI(GetIt.instance);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) {
      return GetIt.I.get<BooksBloc>();
    }),
    BlocProvider(create: (context) {
      return GetIt.I.get<BookDetailsBloc>();
    }),
    BlocProvider(create: (context) {
      return GetIt.I.get<FavoritesCubit>();
    }),
    BlocProvider(create: (context) {
      return GetIt.I.get<SearchCubit>();
    }),
    BlocProvider(create: (context) {
      return GetIt.I.get<SettingsCubit>();
    })
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OSSelector(
        android: android.MaterialApp.router(
          supportedLocales: const [Locale('en')],
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          routerConfig: goRouter,
          themeMode: android.ThemeMode.system,
          theme: lightTheme(android.ThemeData.light()),
          darkTheme: darkTheme(android.ThemeData.dark()),
        ),
        iOS: ios.CupertinoApp.router(
          routerConfig: goRouter,
          supportedLocales: const [Locale('en')],
          localizationsDelegates: const [
            S.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
        ));
  }
}
