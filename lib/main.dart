import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/connectivity_provider.dart';
import 'package:weather_app/providers/convert_provider.dart';
import 'package:weather_app/providers/themeprovider.dart';

import 'Views/Splace_Screen.dart';
import 'Views/detail_page.dart';
import 'Views/home_page.dart';
import 'Views/intro_Screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Themeprovider(),
    ),
    ChangeNotifierProvider(create: (_) => ConavertProvider()),
    ChangeNotifierProvider(create: (_) => ConnectivityProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: (Provider.of<Themeprovider>(context).themeModel.isTap)
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: 'SplaceScreen',
      routes: {
        '/': (context) => HomePage(),
        'IntroScreen': (context) => IntroScreen(),
        'DetailPage': (context) => DetailPage(),
        'SplaceScreen': (context) => SplaceScreen()
      },
    );
  }
}
