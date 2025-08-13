// ...............
import 'pages/bab_3.dart';
import 'package:flutter/material.dart';
import 'pages/bab_2.dart';
import 'pages/bab_4.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'Bab3', // Match the route name exactly
      routes: {
        'Bab2': (context) => const Bab2(),
        'Bab3': (context) => const Bab3(),
        'Bab4': (context) => const Bab4(),
      },
    );
  }
}