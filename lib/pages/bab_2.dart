// bab_2.dart
import 'package:flutter/material.dart';

// Widget ini akan menjadi halaman "Bab 2"
class Bab2 extends StatelessWidget {
  const Bab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('halaman Bab 2'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
    body: Center(
      child: Text(
        '|Yusuf Nawaf Albana \n XI RPL',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    );
  }
}
