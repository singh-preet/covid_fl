import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

class AppPreferences{
  static late AppPreferences _appPreferences;
  static late SharedPreferences _prefs;
  static Lock _lock = Lock();

  /// call this method from iniState() function of mainApp().
  static Future<AppPreferences> getInstance() async {
      await _lock.synchronized(
            () async {
            // keep local instance till it is fully initialized.
            var singleton = AppPreferences._();
            await singleton._init();
            _appPreferences = singleton;
        },
      );
    return _appPreferences;
  }

  AppPreferences._();

  Future _init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  ///keys
  static String appId = 'appId';
  static String userId = 'userId';


  /// sets methods
  static Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    return await _prefs.setDouble(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  static Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  /// gets methods
  static bool? getBool(String key) {
    if (_prefs == null) return null;
    return _prefs.getBool(key);
  }

  static double? getDouble(String key) {
    if (_prefs == null) return null;
    return _prefs.getDouble(key);
  }

  static int? getInt(String key) {
    if (_prefs == null) return null;
    return _prefs.getInt(key);
  }

  static String? getString(String key) {
    if (_prefs == null) return null;
    return _prefs.getString(key);
  }

  static List<String>? getStringList(String key) {
    if (_prefs == null) return null;
    return _prefs.getStringList(key);
  }

  ///delete methods
  static Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  /// clear Pref
  static Future<bool> clear() async {
    return await _prefs.clear();
  }

  /// Pref contains key
  static bool containsKey(String key) {
    return _prefs.containsKey(key);
  }
}