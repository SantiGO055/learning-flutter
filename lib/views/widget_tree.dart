import 'package:flutter/material.dart';
import 'package:app_incense/views/data/constants.dart';
import 'package:app_incense/views/data/notifiers.dart';
import 'package:app_incense/views/pages/home_page.dart';
import 'package:app_incense/views/pages/profile_page.dart';
import 'package:app_incense/views/pages/settings_page.dart';
import 'package:app_incense/views/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
              await prefs.setBool(
                  KConstants.themeModeKey, isDarkModeNotifier.value);
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
                        builder: (context) => SettingsPage()));
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
