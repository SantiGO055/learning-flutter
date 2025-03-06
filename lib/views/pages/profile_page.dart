import 'package:flutter/material.dart';
import 'package:flutter_app_test/views/data/notifiers.dart';
import 'package:flutter_app_test/views/pages/welcome_page.dart'; 

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Logout'),
            onTap: (){
              selectedPageNotifier.value = 0;
              Navigator.pushReplacement(
                      context, //pushReplacement se suele usar cuando se usa login y despues se redirige al home, borra la pila de navegacion
                      MaterialPageRoute(
                          builder: (context) => WelcomePage()));
            },
          ),
        ],
      ),
    );
  }
}
