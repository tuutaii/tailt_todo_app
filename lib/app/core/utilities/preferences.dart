import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  factory Preferences() => _instance;

  Preferences._internal();

  static final Preferences _instance = Preferences._internal();

  static late SharedPreferences pref;

  static Future<void> setPreferences() async {
    pref = await SharedPreferences.getInstance();
    pref.getBool('theme');
  }

  static Future<bool> clear() => pref.clear();

  static bool containsKey(String key) => pref.containsKey(key);

  static Object? get(String key) => pref.get(key);

  static bool getBool(String key) => pref.getBool(key) ?? false;

  static double getDouble(String key) => pref.getDouble(key)!;

  static int getInt(String key) => pref.getInt(key)!;

  static Set<String> getKeys() => pref.getKeys();

  static String? getString(String key) => pref.getString(key);

  static List<String>? getStringList(String key) => pref.getStringList(key);

  static Future<void> reload() => pref.reload();

  static Future<bool> remove(String key) => pref.remove(key);

  static Future<bool> setBool(String key, bool value) {
    return pref.setBool(key, value);
  }

  static Future<bool> setDouble(String key, double value) {
    return pref.setDouble(key, value);
  }

  static Future<bool> setInt(String key, int value) {
    return pref.setInt(key, value);
  }

  static void setString(String key, String value) {
    pref.setString(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) {
    return pref.setStringList(key, value);
  }
}
