import 'package:flutter/material.dart';
import 'package:app_incense/third_page.dart';

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
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.date_range),
              trailing: const Icon(Icons.arrow_back),
              title: const Text("Go back to home"),
              subtitle: const Text("This will pop the current page"),
              onTap: () {
                Navigator.pop(context);
              },
          ),
          Container(
            color: Colors.greenAccent,
            child: ListTile(
              leading: const Icon(Icons.date_range),
              trailing: const Icon(Icons.arrow_forward),
              title: const Text("Go to third page"),
              subtitle: const Text("This will go to the third page"),
              onTap: () {
                Navigator.pushNamed(context, ThirdPage.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
