import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mymoney/res/allSharePreferencesKey.dart';
import 'package:mymoney/screen/home/drawer_open_.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screen/welcome/welcome_screen.dart';

import 'utils/color.dart';

double screenWidth = 0.0;
double screenHeight = 0.0;
SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: sharedPreferences.getString(AllSharedPreferencesKey.userId) ==
                  null ||
              sharedPreferences.getString(AllSharedPreferencesKey.userId) == ""
          ? WelcomeScreen()
          : DrawerOpenScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: white,
        ),
      ),
    );
  }
}
