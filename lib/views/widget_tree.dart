import 'package:flutter/material.dart';
import 'package:flutter_app_test/views/data/notifiers.dart';
import 'package:flutter_app_test/views/pages/home_page.dart';
import 'package:flutter_app_test/views/pages/profile_page.dart';
import 'package:flutter_app_test/views/widgets/navbar_widget.dart';

List<Widget> pages= [
  const HomePage(),
  const ProfilePage()
];
class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Learn"),
          centerTitle: true,
        ),
        bottomNavigationBar: NavbarWidget(),
        body: ValueListenableBuilder(valueListenable: selectedPageNotifier, builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        }),
      );
  }
}