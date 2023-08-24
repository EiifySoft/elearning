// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences preferences;

  Future<StorageService> init() async {
    preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await preferences.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await preferences.setString(key, value);
  }

  bool getAppInitial() {
    return preferences.getBool(StroageConstants.APP_FIRST_OPEN) ?? false;
  }

  bool getLoggedIn() {
    return preferences.getString(StroageConstants.USER_TOKEN_KEY) == null
        ? false
        : true;
  }
}

class StroageConstants {
  static const String APP_FIRST_OPEN = "app-initial-key";
  static const String USER_PROFILE_KEY = "user-profile-key";
  static const String USER_TOKEN_KEY = "user-token-key";
}
