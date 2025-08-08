// bab_2.dart
import 'package:flutter/material.dart';

// Widget ini akan menjadi halaman "Bab 2"
class Bab3 extends StatelessWidget {
  const Bab3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Bab ke cvb'),
      ),
       body: Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Image.asset(
           'assets/images/hai.jpg',
           width: 150, // atur ukuran sesuai kebutuhan
           height: 150,
         ),
         const SizedBox(height: 16),
         const Text(
           'Ini adalah isi dari Bab 3.',
           style: TextStyle(fontSize: 24),
         ),
       ],
     ),
   ),
    );
  }
}
