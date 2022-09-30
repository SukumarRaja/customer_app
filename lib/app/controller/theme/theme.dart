import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.put(ThemeController());

  final _darkTheme = false.obs;

  get darkTheme => _darkTheme.value;

  set darkTheme(value) {
    _darkTheme.value = value;
  }

  currentTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    darkTheme = preferences.getBool('theme');
  }

  changeTheme() async {
    darkTheme = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('theme', darkTheme);
  }
}
