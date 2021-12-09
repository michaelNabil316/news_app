import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? pref;

  static initDarkModePref() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<bool> setIsDarkPref({required bool value}) async {
    return await pref!.setBool('isDark', value);
  }

  static bool? getIsDarkPref() {
    return pref!.getBool('isDark');
  }
}
