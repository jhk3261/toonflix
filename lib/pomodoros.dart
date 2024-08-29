import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //backgroundColor 바로 쓰면 오류! (옛날버젼)
        scaffoldBackgroundColor: const Color(0xFFE7626C),
        textTheme: const TextTheme(
          //headline1 오류
          headlineLarge: TextStyle(
            color: Color(0XFF232B55),
          ),
        ),
        cardColor: const Color(0XFFF4EDD8),
      ),
      home: const HomeScreen(),
    );
  }
}
