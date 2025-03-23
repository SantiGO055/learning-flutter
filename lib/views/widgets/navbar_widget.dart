import 'package:flutter/material.dart';
import 'package:app_incense/views/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedPageNotifier, //lee el valor de notifier
        builder: (context, selectedPage, child) {
          return NavigationBar(
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
            onDestinationSelected: (int value) {
              selectedPageNotifier.value = value; //actualiza el valor de notifiers
            },
            selectedIndex: selectedPage,
          );
        });
  }
}
