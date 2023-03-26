// ignore_for_file: file_names

import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/views/subj_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SubjectListScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "images/quizLogo.png",
              height: 120,
              width: 150,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedTextKit(animatedTexts: [
            TypewriterAnimatedText(
              "Welcome Quiz App",
              // speed: const Duration(milliseconds: 1000),
              textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
