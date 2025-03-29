// ignore_for_file: avoid_print

import 'package:app_incense/views/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_incense/second_page.dart';
import 'package:app_incense/third_page.dart';
import 'package:app_incense/views/data/constants.dart';
import 'package:app_incense/views/data/notifiers.dart';
import 'package:app_incense/views/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key}); 

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initThemeMode();
    super.initState();
  }

  Future<void> initThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? valueDarkMode = prefs.getBool(KConstants.themeModeKey);
    isDarkModeNotifier.value = valueDarkMode ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), //aca primero arranca splashscreen
      routes: {
        MyScaffoldApp.routeName: (_) => const MyScaffoldApp(),
        SecondPage.routeName: (_) => const SecondPage(),
        ThirdPage.routeName: (_) => const ThirdPage(),
      },
    );
  }
}

class MyScaffoldApp extends StatefulWidget {
  const MyScaffoldApp({super.key});
  static const routeName = "home";

  @override
  State<MyScaffoldApp> createState() => _MyScaffoldAppState();
}

class _MyScaffoldAppState extends State<MyScaffoldApp> {
  bool myNewButton = false;
  String myText = "Hello";

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isDarkModeNotifier,
        builder: (context, isDarkMode, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.teal,
                brightness: isDarkMode ? Brightness.dark : Brightness.light,
              ),
            ),
            home: WelcomePage(), //redirige a pantalla de bienvenida
          );
        });
  }
}
