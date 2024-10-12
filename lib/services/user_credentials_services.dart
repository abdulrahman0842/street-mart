import 'package:shared_preferences/shared_preferences.dart';

class UserCredentialsServices {
  static SharedPreferences? _sharedPreferences;

  static Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance {
    if (_sharedPreferences == null) {
      throw ('SharedPreferences not initialized');
    } else {
      return _sharedPreferences!;
    }
  }

  static Future<void> saveCred(String? name, String email, String password) async {
    await instance.setString('userName', name ?? 'Unknown');
    await instance.setString('email', email);
    await instance.setString('password', password);
  }

  static String? getCred(String key) {
    return instance.getString(key);
  }

  static void login()  {
     instance.setBool('isLoggedIn', true);
  }

  static void logout()  {
     instance.setBool('isLoggedIn', false);
  }

  static Future<bool> isLoggedIn()async {
    return instance.getBool('isLoggedIn')??false;
  }
}
