import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  late bool change = false;
  void IntroScreen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    change = sharedPreferences.getBool('intro') ?? false;
  }

  void initState() {
    super.initState();
    loadPreferencesAndNavigate();
  }

  Future<void> loadPreferencesAndNavigate() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    change = sharedPreferences.getBool('intro') ?? false;
    Timer(Duration(seconds: 3), () {
      if (change) {
        Navigator.of(context).pushNamedAndRemoveUntil('/', (context) => false);
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('IntroScreen', (context) => false);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff0168F2).withOpacity(0.9),
              Color(0xff0168F2).withOpacity(0.7),
              Color(0xff034EE8).withOpacity(0.8)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/icon/drizzle(1).png"))),
            ),
          ],
        ),
      ),
    );
  }
}
