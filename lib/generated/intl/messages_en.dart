// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) =>
      "${Intl.plural(count, zero: 'No follower', one: '1 follower', other: '${count} followers')}";

  static String m1(count) =>
      "${Intl.plural(count, zero: '0 Review', one: '1 Review', other: '${count} reviews')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("BookClub"),
        "bookDetails": MessageLookupByLibrary.simpleMessage("Book Details"),
        "bookNotFound": MessageLookupByLibrary.simpleMessage("Book not found."),
        "books": MessageLookupByLibrary.simpleMessage("Books"),
        "buy": MessageLookupByLibrary.simpleMessage("Buy"),
        "ebook": MessageLookupByLibrary.simpleMessage("E-Book"),
        "empty": MessageLookupByLibrary.simpleMessage("Empty"),
        "favorite": MessageLookupByLibrary.simpleMessage("Favorite"),
        "following": MessageLookupByLibrary.simpleMessage("Following"),
        "nFollower": m0,
        "nReviews": m1,
        "pages": MessageLookupByLibrary.simpleMessage("pages"),
        "recommended": MessageLookupByLibrary.simpleMessage("Recommended"),
        "tab_favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
        "tab_home": MessageLookupByLibrary.simpleMessage("Home"),
        "tab_settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "trends": MessageLookupByLibrary.simpleMessage("Trends"),
        "wouldYouLikeUnfollow":
            MessageLookupByLibrary.simpleMessage("Would you like unfollow?"),
        "writer": MessageLookupByLibrary.simpleMessage("Writer")
      };
}
