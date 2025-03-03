import 'package:flutter/material.dart';
import 'package:flutter_app_test/third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  static const routeName = "second_page";

  backToHome(context, routeName) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () =>
                    {
                    },
                child: const Text("Home"))
          ],
        ),
      ),
    );
  }
}
