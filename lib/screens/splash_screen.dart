import 'dart:async';

import 'package:bmi_calculator/variables.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamed('home_page');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/img1.png',
              height: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "BMI CALCULATOR",
              style: TextStyle(
                fontSize: 22,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
                color: inactivecolor,
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            const CircularProgressIndicator(),
            Text("Check your BMI", style: TextStyle(
              fontSize: 15,
              letterSpacing: 2,
              fontWeight: FontWeight.w600,
              color: inactivecolor.withOpacity(0.3),
            ),),
          ],
        ),
      ),
    );
  }
}
