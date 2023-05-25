import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:keep_word/core/storage/ILocalStorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManager extends GetxService implements ILocalStorage {
  static SharedPreferences? _sharedPreferences;
  static final LocalStorageManager _instance = LocalStorageManager._init();
  static LocalStorageManager get instance => _instance;

  LocalStorageManager._init() {
    SharedPreferences.getInstance()
        .then((value) => _sharedPreferences ??= value);
  }

  @override
  Future setString(String key, String value) async {
    await _sharedPreferences!.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _sharedPreferences!.getString(key);
  }

  @override
  Future setBool(String key, bool value) async {
    await _sharedPreferences!.setBool(key, value);
  }

  @override
  bool? getBool(String key) {
    return _sharedPreferences!.getBool(key);
  }

  @override
  Future clearValue(String key) async {
    await _sharedPreferences!.remove(key);
  }

  @override
  Future clearAll() async {
    await _sharedPreferences!.clear();
  }

  @override
  Set<String?> getKeys()  {
    return _sharedPreferences!.getKeys();
  }
}
