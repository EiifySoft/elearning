import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences preferences;

  Future<StorageService> init() async {
    preferences = await SharedPreferences.getInstance();
    return this;
  }
}
