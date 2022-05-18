import 'package:bmi_calculator/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../variables.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String bmiresult = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    if (args < 18.5) {
      bmiresult = "UNDER WEIGHT";
      description = "You have under body weight";
    } else if (args >= 18.5 && args <= 24.9) {
      bmiresult = "NORMAL WEIGHT";
      description = "You have normal body weight";
    } else if (args >= 25 && args <= 29.9) {
      bmiresult = "OVERWEIGHT";
      description = "You have over body weight";
    } else if (args >= 30) {
      bmiresult = "OBESITY";
      description = "You have obesity body weight";
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Align(
            alignment: Alignment(-0.8, 0),
            child: Text(
              "Your BMI result",
              style: TextStyle(
                fontSize: 30,
                color: activecolor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            height: 400,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [
                  Colors.blueAccent,
                  activecolor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.mirror,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(2, 5),
                  spreadRadius: 3,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  bmiresult,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFffffff),
                  ),
                ),
                Text(
                  args.toString().split(".")[0],
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: inactivecolor,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: inactivecolor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
