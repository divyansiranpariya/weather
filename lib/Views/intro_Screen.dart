import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff0168F2),
            Color(0xff0168F2).withOpacity(0.4),
            Color(0xff034EE8).withOpacity(0.4)
          ],
        )),
        child: Center(
          child: GlassmorphicContainer(
            width: 300,
            height: 500,
            borderRadius: 20,
            blur: 20,
            alignment: Alignment.center,
            border: 2,
            linearGradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.3),
                Colors.white70.withOpacity(0.3)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                Color(0xff0168F2),
                Color(0xff0168F2).withOpacity(0.4),
                Color(0xff034EE8).withOpacity(0.4)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/icon/drizzle(1).png"))),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Weather Forecasts",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard text ever since the 1500s.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () async {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (context) => false);
                      SharedPreferences sharedPreference =
                          await SharedPreferences.getInstance();
                      sharedPreference.setBool("intro", true);
                    },
                    child: GlassmorphicContainer(
                      width: 150,
                      height: 50,
                      borderRadius: 30,
                      blur: 20,
                      alignment: Alignment.center,
                      border: 1,
                      linearGradient: LinearGradient(
                        colors: [
                          Colors.yellow.withOpacity(0.3),
                          Colors.orange.withOpacity(0.2),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderGradient: LinearGradient(
                        colors: [
                          Colors.yellow.withOpacity(0.2),
                          Colors.orange.withOpacity(0.1),
                          Colors.red.withOpacity(0.05),
                          Colors.red.withOpacity(0.01),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
