import '../../utiles/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static SharedPreferences? _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<bool> set(Preferences preferenceKey, value) async {
    if (_preferences != null) {
      print("inside set");
      print(preferenceKey.toString());
      switch (preferenceKey.getType) {
        case (List<String>):
          return _preferences!.setStringList(preferenceKey.toString(), value);
        default:
          return _preferences!.setString(preferenceKey.toString(), value);
      }
    } else {
      return Future(() => false);
    }
  }

  static dynamic get(
    Preferences preference,
  ) {
    if (_preferences != null &&
        _preferences!.containsKey(preference.toString())) {
      switch (preference.getType) {
        case (List<String>):
          return _preferences!.getStringList(preference.toString());
        default:
          return _preferences!.get(preference.toString());
      }
    } else {
      return null;
    }
  }
}
