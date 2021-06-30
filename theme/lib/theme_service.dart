import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:theme/themes/dark.dart';
import 'package:theme/themes/light.dart';

class ThemeService {
  Box<dynamic> _box = Hive.box('Theme');

  ThemeData getTheme() {
    String? theme = _box.get('Theme');
    ThemeData themeData;

    if (theme == null) {
      if (Get.isPlatformDarkMode) {
        themeData = DarkTheme().theme;
        saveTheme("Dark");
      } else {
        themeData = LightTheme().theme;
        saveTheme("Light");
      }
    } else if (theme == "Light") {
      themeData = LightTheme().theme;
    } else {
      themeData = DarkTheme().theme;
    }

    return themeData;
  }

  void changeTheme(ThemeData theme, String themeId) {
    Get.changeTheme(theme);
    saveTheme(themeId);
  }

  void saveTheme(String theme) {
    _box.put("Theme", theme);
  }
}
