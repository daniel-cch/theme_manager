import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:theme/home.dart';
import 'package:theme/themes/dark.dart';
import 'package:theme/themes/light.dart';
import 'package:theme_provider/theme_provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('Theme');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: [
        AppTheme(
          id: "light",
          description: "Light Theme",
          data: LightTheme().theme,
        ),
        AppTheme(
          id: "dark",
          description: "Dark Theme",
          data: DarkTheme().theme,
        ),
      ],
      defaultThemeId: SchedulerBinding.instance!.window.platformBrightness ==
              Brightness.dark
          ? "dark"
          : "light",
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => GetMaterialApp(
            title: 'Theme Demo',
            theme: ThemeProvider.themeOf(themeContext).data,
            home: Home(),
          ),
        ),
      ),
    );
  }
}
