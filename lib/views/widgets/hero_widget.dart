import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: 'hero1',
          child: // ClipRRect crea cualquier widget con bordes redondeados
              ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset("assets/images/bg.jpg"),
          ),
        ),
        FittedBox(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w900,
              letterSpacing: 50.0,
              color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}
