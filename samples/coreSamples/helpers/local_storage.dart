import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<SharedPreferences> getPreferences() {
    return SharedPreferences.getInstance();
  }
}
