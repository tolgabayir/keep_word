mixin ILocalStorage {
  Future setString(String key, String value);

  String? getString(String key);

  Set<String?> getKeys();

  Future setBool(String key, bool value);

  bool? getBool(String key);

  Future clearValue(String key);

  Future clearAll();
}
