import 'package:flutter/material.dart';
import 'package:app_incense/views/pages/welcome_page.dart';
import 'package:app_incense/views/widgets/hero_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            HeroWidget(
              title: "Login",
            ),
            TextButton(
                onPressed: () => {
                      Navigator.pushReplacement(
                          context, //pushReplacement se suele usar cuando se redirige a otra pagina y se borra la pila de navegacion
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()))
                    },
                child: Text("Go Back")), 
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: controllerText,
              onEditingComplete: () => {setState(() {})},
            ),
          ],
        ),
      ),
    );
  }
}
