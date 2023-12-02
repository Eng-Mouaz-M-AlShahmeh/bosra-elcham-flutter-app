// Developed by Eng. Mouaz M. Al-Shahmeh
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500), () {
      context.goNamed('/home');
    });
    return FlutterSplashScreen.fadeIn(
      gradient: RadialGradient(
        radius: 0.8,
        colors: [
          Theme.of(context).primaryColor.withAlpha(150),
          Theme.of(context).primaryColor.withAlpha(250),
        ],
      ),
      childWidget: SizedBox(
        height: 200,
        child: Image.asset('assets/images/logo.png'),
      ),
      animationDuration: const Duration(milliseconds: 1000),
    );
  }
}
