import 'package:flutter/material.dart';
import 'package:flutter_app_test/views/data/notifiers.dart';
import 'package:flutter_app_test/views/pages/home_page.dart';
import 'package:flutter_app_test/views/pages/profile_page.dart';
import 'package:flutter_app_test/views/pages/settings_page.dart';
import 'package:flutter_app_test/views/widgets/navbar_widget.dart';

List<Widget> pages = [const HomePage(), const ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Learn"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
                valueListenable: isDarkModeNotifier,
                builder: (context, isDarkMode, child) {
                  return Icon(isDarkModeNotifier.value
                      ? Icons.dark_mode
                      : Icons.light_mode);
                }),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, //pushReplacement se suele usar cuando se usa login y despues se redirige al home, borra la pila de navegacion
                    MaterialPageRoute(
                        builder: (context) => SettingsPage(
                              title: 'Settingaaas',
                            )));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      bottomNavigationBar: NavbarWidget(),
      body: ValueListenableBuilder(
          valueListenable: selectedPageNotifier,
          builder: (context, selectedPage, child) =>
              pages.elementAt(selectedPage)),
    );
  }
}
