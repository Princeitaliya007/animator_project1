import 'package:bmi_calculator/screens/home_page.dart';
import 'package:bmi_calculator/screens/second_page.dart';
import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFffffff),
        scaffoldBackgroundColor: const Color(0xFFf6f8ff),
      ),
      routes: {
        '/' : (context) => const SplashScreen(),
        'home_page' : (context) => const HomePage(),
        'second_page' : (context) => const SecondPage(),
      },
    ),
  );
}