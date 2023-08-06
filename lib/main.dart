import 'package:animator_planet/views/screen/Detail_Page.dart';
import 'package:animator_planet/views/screen/Home_Page.dart';
import 'package:animator_planet/views/screen/Splash_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true
      ),
     routes: {
        '/': (context) => Splash_Screen(),
        'homepage': (context) => Home_Page(),
       'detail': (context) => Detail_Page(),
     },
    );
  }
}
