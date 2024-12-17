import 'package:flutter/material.dart';
import 'package:my_favorite_lists/pages/home.dart';
import 'package:my_favorite_lists/pages/splashScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Favorite List',
      home: SplashScreen(),
    );
  }
}