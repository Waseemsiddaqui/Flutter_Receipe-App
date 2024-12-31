import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context,'/home');
    }
    );

    return Scaffold(
      backgroundColor: Colors.teal,
      body:Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.teal,

          ),
          Lottie.asset('assets/animations/recipe_splash3.json',
          width: 400,
          height:400,
          ),
          Positioned(
            width: 270,
            height: 340,
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText("Welcome To Recipe App",
                textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                  speed: Duration(milliseconds: 100),
                ),
                ],
          ),
    ),
        ],

        ),
            );
  }
}
