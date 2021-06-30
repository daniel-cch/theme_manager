import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme/second.dart';
import 'package:theme_provider/theme_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("My App"),
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
              ThemeProvider.controllerOf(context).setTheme('light');
            },
            child: Text("Change To Light Theme"),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Second()),
              );
            },
            child: Text("Go to Second"),
          )
        ],
      ),
    );
  }
}
