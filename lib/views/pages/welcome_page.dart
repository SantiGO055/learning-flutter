import 'package:flutter/material.dart';
import 'package:app_incense/views/pages/login_page.dart';
import 'package:app_incense/views/widget_tree.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lotties/welcome.json'),
            FittedBox(
              child: Text(
                'Bienvenido a la app',
                style: TextStyle(
                  fontSize: 150.0,
                  letterSpacing: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, //pushReplacement se suele usar cuando se usa login y despues se redirige al home, borra la pila de navegacion
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: FilledButton.styleFrom(minimumSize: Size(double.infinity, 40.0)),
                child: Text("Get Started")),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, //pushReplacement se suele usar cuando se usa login y despues se redirige al home, borra la pila de navegacion
                      MaterialPageRoute(builder: (context) => WidgetTree()));
                },
                style: FilledButton.styleFrom(minimumSize: Size(double.infinity, 40.0)),
                child: Text("Login"),
                )
          ],
        ),
      ),
    );
  }
}
