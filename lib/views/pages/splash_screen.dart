import 'dart:async';

import 'package:app_incense/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key

    });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () { // Duración del splash screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyScaffoldApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lotties/splash.json'), // Muestra el GIF
      ),
    );
  }
}