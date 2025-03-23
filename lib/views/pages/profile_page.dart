import 'package:flutter/material.dart';
import 'package:app_incense/views/data/notifiers.dart';
import 'package:app_incense/views/pages/welcome_page.dart'; 

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('assets/images/person.png'), //AssetImage solo se usa en el circle avatar
          ),
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
