import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero1',
      child: // ClipRRect crea cualquier widget con bordes redondeados
          ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset("images/bg.jpg"),
      ),
    );
  }
}
