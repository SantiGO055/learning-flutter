// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_app_test/second_page.dart';
import 'package:flutter_app_test/third_page.dart';

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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyScaffoldApp(),
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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal, brightness: Brightness.dark)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Learn"),
          centerTitle: true,
        ),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onDestinationSelected: (int value){
            setState((){
              selectedIndex = value;
            });
          },
          selectedIndex: selectedIndex,
        ),
      ),
    );
  }
}
