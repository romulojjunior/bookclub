// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `BookClub`
  String get appName {
    return Intl.message(
      'BookClub',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Books`
  String get books {
    return Intl.message(
      'Books',
      name: 'books',
      desc: '',
      args: [],
    );
  }

  /// `Writer`
  String get writer {
    return Intl.message(
      'Writer',
      name: 'writer',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get following {
    return Intl.message(
      'Following',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `Trends`
  String get trends {
    return Intl.message(
      'Trends',
      name: 'trends',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get recommended {
    return Intl.message(
      'Recommended',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `Would you like unfollow?`
  String get wouldYouLikeUnfollow {
    return Intl.message(
      'Would you like unfollow?',
      name: 'wouldYouLikeUnfollow',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get tab_home {
    return Intl.message(
      'Home',
      name: 'tab_home',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get tab_favorites {
    return Intl.message(
      'Favorites',
      name: 'tab_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get tab_settings {
    return Intl.message(
      'Settings',
      name: 'tab_settings',
      desc: '',
      args: [],
    );
  }

  /// `Book Details`
  String get bookDetails {
    return Intl.message(
      'Book Details',
      name: 'bookDetails',
      desc: '',
      args: [],
    );
  }

  /// `Book not found.`
  String get bookNotFound {
    return Intl.message(
      'Book not found.',
      name: 'bookNotFound',
      desc: '',
      args: [],
    );
  }

  /// `E-Book`
  String get ebook {
    return Intl.message(
      'E-Book',
      name: 'ebook',
      desc: '',
      args: [],
    );
  }

  /// `pages`
  String get pages {
    return Intl.message(
      'pages',
      name: 'pages',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =0{No follower} =1{1 follower} other{{count} followers}}`
  String nFollower(num count) {
    return Intl.plural(
      count,
      zero: 'No follower',
      one: '1 follower',
      other: '$count followers',
      name: 'nFollower',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{0 Review} =1{1 Review} other{{count} reviews}}`
  String nReviews(num count) {
    return Intl.plural(
      count,
      zero: '0 Review',
      one: '1 Review',
      other: '$count reviews',
      name: 'nReviews',
      desc: '',
      args: [count],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
