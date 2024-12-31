import 'package:flutter/material.dart';
import 'package:recipe_app/screens/splash_screen.dart';
import 'package:recipe_app/screens/recipelistscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => const SplashScreen(),
      '/home': (context) => const Recipelistscreen()
    });
  }
}
