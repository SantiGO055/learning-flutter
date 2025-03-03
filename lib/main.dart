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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello world"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(child: const Text("My button"), onPressed: () {}),
            Container(
              height: 200,
              width: 100,
              color: Colors.indigo,
              child: Row(
                children: [
                  Text(myNewButton ? "This is true" : myText),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.pinkAccent,
              ),
              child: const Text("Whatever"),
            ),
            Image.network(
                "https://media.istockphoto.com/id/1403500817/photo/the-craggies-in-the-blue-ridge-mountains.jpg?s=612x612&w=0&k=20&c=N-pGA8OClRVDzRfj_9AqANnOaDS3devZWwrQNwZuDSk="),
            Image.asset("images/matrix.jpg"),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          children: [
            Spacer(),
            IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(SecondPage.routeName);
                }),
            Spacer(),
            IconButton(
                icon: const Icon(
                  Icons.notifications_active,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(ThirdPage.routeName);
                }),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
