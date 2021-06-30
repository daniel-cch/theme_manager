import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_provider/theme_provider.dart';

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Second Screen"),
          SizedBox(
            height: 20,
          ),
          Text(context.theme.runtimeType.toString()),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              // ThemeService().changeTheme(
              //   DarkTheme().theme,
              //   "Dark",
              // );
              ThemeProvider.controllerOf(context).setTheme("dark");
            },
            child: Text("Change To Dark Theme"),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              // ThemeService().changeTheme(
              //   LightTheme().theme,
              //   "Light",
              // );
              ThemeProvider.controllerOf(context).setTheme("light");
            },
            child: Text("Change To Light Theme"),
          ),
        ],
      ),
    );
  }
}
