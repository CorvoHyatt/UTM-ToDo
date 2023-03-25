import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/views/Onboard/onboard_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duracion = const Duration(seconds: 4);
    return Timer(duracion, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const OnboardView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
          ),
          Center(
            child: Image.asset("assets/logo/logo-no-background.png", scale: 3),
          )
        ],
      ),
    );
  }
}
