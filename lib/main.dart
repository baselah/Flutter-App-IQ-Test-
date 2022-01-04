import 'package:flutter/material.dart';
import 'package:quizapp/Screens/about_us_screen.dart';
import 'package:quizapp/Screens/home_page.dart';
import 'package:quizapp/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IQ Test',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'JosefinSans',
        brightness: Brightness.light,
      ),
      home: const WelcomeWidget(),
      routes:  {
        HomePage.routeName :(ctx)=>const HomePage(),
        AboutUS.routeNName :(ctx)=>const AboutUS(),
      },
      
    );
  }
}

