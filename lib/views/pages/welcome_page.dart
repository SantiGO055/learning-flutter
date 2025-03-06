import 'package:flutter/material.dart';
import 'package:flutter_app_test/views/widget_tree.dart';
import 'package:flutter_app_test/views/widgets/hero_widget.dart';

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
            HeroWidget(),
            FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, //pushReplacement se suele usar cuando se usa login y despues se redirige al home, borra la pila de navegacion
                      MaterialPageRoute(
                          builder: (context) => WidgetTree()));
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
