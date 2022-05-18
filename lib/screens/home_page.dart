import 'package:bmi_calculator/logics/bmi_logic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
      lowerBound: -1,
      upperBound: 0,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFf6f8ff),
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AnimatedBuilder(
                      animation: _controller,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            updateBoxColor(1);
                          });
                        },
                        child: ContainerBox(
                          boxcolor: maleboxcolor,
                          childwidget: DataContainer(
                            iconData: FontAwesomeIcons.mars,
                            title: "MALE",
                          ),
                        ),
                      ),
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(_controller.value * 150, 0),
                          child: child,
                        );
                      }),
                ),
                Expanded(
                  child: AnimatedBuilder(
                      animation: _controller,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            updateBoxColor(2);
                          });
                        },
                        child: ContainerBox(
                          boxcolor: femaleboxcolor,
                          childwidget: DataContainer(
                            iconData: FontAwesomeIcons.venus,
                            title: "FEMALE",
                          ),
                        ),
                      ),
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(-150 * _controller.value, 0),
                          child: child,
                        );
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
                animation: _controller,
                child: ContainerBox(
                  boxcolor: const Color(0xFFffffff),
                  childwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "HEIGHT",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "${sliderval.toInt()}",
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            "cm",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Slider(
                        value: sliderval,
                        min: 50,
                        max: 200,
                        onChanged: (val) {
                          setState(() {
                            sliderval = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(-400 * _controller.value, 0),
                    child: child,
                  );
                }),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AnimatedBuilder(
                      animation: _controller,
                      child: ContainerBox(
                        boxcolor: const Color(0xFFffffff),
                        childwidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "WEIGHT",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                            Text(
                              "$weight",
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w700),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: activecolor,
                                  mini: true,
                                  child: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      if (weight >= 0) {
                                        weight++;
                                      }
                                    });
                                  },
                                ),
                                FloatingActionButton(
                                  backgroundColor: activecolor,
                                  mini: true,
                                  child: const Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 0) {
                                        weight--;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(_controller.value * 150, 0),
                          child: child,
                        );
                      }),
                ),
                Expanded(
                  child: AnimatedBuilder(
                      animation: _controller,
                      child: ContainerBox(
                        boxcolor: const Color(0xFFffffff),
                        childwidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "AGE",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                            Text(
                              "$age",
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w700),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: activecolor,
                                  mini: true,
                                  child: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      if (age >= 0) {
                                        age++;
                                      }
                                    });
                                  },
                                ),
                                FloatingActionButton(
                                  backgroundColor: activecolor,
                                  mini: true,
                                  child: const Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (age > 0) {
                                        age--;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(-150 * _controller.value, 0),
                          child: child,
                        );
                      }),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              bmiLogic();

              Navigator.of(context).pushNamed('second_page', arguments: result);
            },
            child: Container(
              width: double.infinity,
              height: 80,
              color: activecolor,
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: const Text(
                "CALCULATE YOUR BMI",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: inactivecolor,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleboxcolor == inactivecolor) {
        maleboxcolor = activecolor;
        femaleboxcolor = inactivecolor;
      } else {
        maleboxcolor = inactivecolor;
        femaleboxcolor = activecolor;
      }
    } else {
      if (femaleboxcolor == inactivecolor) {
        femaleboxcolor = activecolor;
        maleboxcolor = inactivecolor;
      } else {
        femaleboxcolor = inactivecolor;
        maleboxcolor = activecolor;
      }
    }
  }

}

class DataContainer extends StatelessWidget {
  DataContainer({
    required this.iconData,
    required this.title,
  });

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: const TextStyle(color: Color(0xff000000), fontSize: 20.0),
        ),
      ],
    );
  }
}

class ContainerBox extends StatelessWidget {
  ContainerBox({required this.boxcolor, this.childwidget});

  final Color boxcolor;
  final Widget? childwidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: boxcolor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5.0,
            blurRadius: 7.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: childwidget,
    );
  }
}
