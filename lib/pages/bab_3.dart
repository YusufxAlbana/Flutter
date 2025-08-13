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
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(16),
          width: 350,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Image.asset(
                  'assets/images/hai.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Yusuf Nawaf Albana',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Pekerjaan : Siswa IDN',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.home, color: Colors.white, size: 32),
                  SizedBox(width: 8),
                  Icon(Icons.email, color: Colors.white, size: 32),
                  SizedBox(width: 8),
                  Icon(Icons.chat_bubble, color: Colors.white, size: 32),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}