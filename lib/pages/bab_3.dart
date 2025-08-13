import 'package:flutter/material.dart';

class Bab3 extends StatelessWidget {
  const Bab3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Bab ke 3'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20), // Padding di semua sisi
          margin: const EdgeInsets.all(16), // tambahin margin biar nggak nempel tepi layar
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(50), // Sudut membulat
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Supaya container ikut ukuran isi
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/hai.jpg',
                width: 150,
                height: 150,

              ),
              const SizedBox(height: 16),
              const Text(
                'Yusuf Nawaf Albana',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Pekerjaan : Siswa IDN',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.home),
                  SizedBox(width: 16),
                  Icon(Icons.email),
                  SizedBox(width: 16),
                  Icon(Icons.chat_bubble),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
