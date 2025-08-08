// bab_2.dart
import 'package:flutter/material.dart';

// Widget ini akan menjadi halaman "Bab 2"
class Bab2 extends StatelessWidget {
  const Bab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Bab 2'),
        backgroundColor: Colors.tealAccent,
      ),
       body: const Center(
        child: Text(
          '| Yusuf Nawaf Albana XI RPL |',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30, // Ukuran font lebih besar
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
