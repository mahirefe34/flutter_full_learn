import 'package:shared_preferences/shared_preferences.dart';
import 'shared_exception.dart';

enum SharedKeys { counter }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (preferences == null) {
      throw SharedNotInitilizeException().toString();
    }
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();

    await preferences?.setString(key.name, value);
  }

  String? getString(SharedKeys key) {
    _checkPreferences();
    return preferences?.getString(key.name);
  }

  Future<void> removeString(SharedKeys key) async {
    _checkPreferences();
    await preferences?.remove(key.name);
  }
}
