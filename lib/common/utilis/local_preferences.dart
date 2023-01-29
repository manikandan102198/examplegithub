import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  static SharedPreferences? _preferences;
  final Future<SharedPreferences> pref = SharedPreferences.getInstance();
  
  static Future<SharedPreferences?> init() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  static Future<bool> setString(String key, String value) async =>
      await _preferences!.setString(key, value);
  
  static Future<bool> setBool(String key, bool value) async =>
      await _preferences!.setBool(key, value);

  static String? getString(String key) => _preferences!.getString(key);

  static Future<bool> remove(String key) async =>
      await _preferences!.remove(key);

  static Future<bool> clear() async => await _preferences!.clear();
}
