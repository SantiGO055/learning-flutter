import 'package:flutter/material.dart';
import 'package:flutter_app_test/main.dart';


class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  static const routeName = "third_page";

  backToHome(context, routeName) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Page"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () =>
                    {},
                child: const Text("Home"))
          ],
        ),
      ),
    );
  }
}
