import 'package:shared_preferences/shared_preferences.dart';

class Check {
  isChecking() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('first_run') ?? true) {
      // FlutterSecureStorage storage = FlutterSecureStorage();

      await prefs.clear();

      prefs.setBool('first_run', false);
    }
  }
}
