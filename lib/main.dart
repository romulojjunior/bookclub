import 'package:bookclub/ui/router.dart';
import 'package:bookclub/ui/theme/app_theme.dart';
import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:flutter/cupertino.dart' as ios;
import 'package:flutter/material.dart' as android;
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OSSelector(
        android: android.MaterialApp.router(
          title: 'App Demo',
          supportedLocales: const [Locale('en')],
          // localizationsDelegates: const [
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalMaterialLocalizations.delegate,
          // ],
          routerConfig: goRouter,
          themeMode: android.ThemeMode.system,
          theme: lightTheme(android.ThemeData.light()),
          darkTheme: darkTheme(android.ThemeData.dark()),
        ),
        iOS: ios.CupertinoApp.router(
          routerConfig: goRouter,
        ));
  }
}
