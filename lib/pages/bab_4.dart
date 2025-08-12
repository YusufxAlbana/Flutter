// Latihan Mandiri
// 1. Buatlah sebuah proyek Flutter baru bernama simple_calculator_app. 
// 2. Desain UI kalkulator sederhana yang memiliki: 
// a. Dua TextField untuk memasukkan dua angka. 
// b. Empat tombol untuk operasi: Tambah (+), Kurang (-), Kali (x), Bagi (/). 
// c. Sebuah Text widget untuk menampilkan hasil perhitungan. 
// 3. Gunakan TextEditingController untuk mengambil nilai dari kedua 
// TextField. 
// 4. Implementasikan logika perhitungan untuk setiap tombol. Ketika tombol 
// ditekan, ambil nilai dari TextField, lakukan perhitungan, dan perbarui Text 
// widget hasil menggunakan setState(). 
// 5. Pastikan Anda menangani kasus di mana input bukan angka atau pembagian 
// dengan nol (Anda bisa menampilkan pesan kesalahan di Text widget hasil). 
// 6. (Opsional, Tingkat Lanjut) Coba implementasikan kalkulator ini menggunakan 
// Provider untuk mengelola state dari dua angka input dan hasil perhitungan. 

import 'package:flutter/material.dart';

class Bab4 extends StatefulWidget {
  const Bab4({super.key});

  @override
  State<Bab4> createState() => _Bab4State();
}

class _Bab4State extends State<Bab4> {
  String _inputText = '';

  void _updateText(String newText) {
    setState(() {
      _inputText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contoh TextField'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Widget TextField yang akan menerima input
                TextField(
                  onChanged: _updateText, // Setiap kali teks berubah, panggil _updateText
                  decoration: const InputDecoration(
                    labelText: 'Ketik sesuatu di sini',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20), // Memberi jarak
                // Widget Text yang menampilkan state terbaru
                Text(
                  'Teks yang Anda ketik: $_inputText',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

