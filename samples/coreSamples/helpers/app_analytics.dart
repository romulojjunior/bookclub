import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';

class AppAnalytics {
  late FirebaseAnalytics _firebaseAnalytics;

  AppAnalytics({FirebaseAnalytics? firebaseAnalytics}) {
    _firebaseAnalytics = firebaseAnalytics ?? GetIt.I.get<FirebaseAnalytics>();
  }

  logEvent(String name, {Map<String, Object?>? parameters}) {
    _firebaseAnalytics.logEvent(name: name, parameters: parameters);
  }

  // EVENTS

  static const platformNameEvent = 'platform_name_event';
  static const signInEvent = 'signin_event';
  static const signUpEvent = 'signup_event';
  static const signOutEvent = 'signout_event';
  static const recoveryPasswordEvent = 'recovery_password_event';
  static const addHashtagEvent = 'add_hashtag_event';
  static const addCardEvent = 'add_card_event';
  static const deleteHashtagEvent = 'delete_hashtag_event';
  static const deleteCardEvent = 'delete_card_event';
  static const playGameEvent = 'play_game_event';
  static const viewProfilePageEvent = 'view_profile_page_event';
  static const viewHashtagDetailsPageEvent = 'view_hashtag_details_page_event';
  static const viewHashtagFormPageEvent = 'view_hashtag_form_page_event';
  static const viewCardFormPageEvent = 'view_card_form_page_event';
  static const viewBackupPageEvent = 'view_backup_page_event';
}
