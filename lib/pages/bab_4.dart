import 'package:flutter/material.dart';

/* 
1. Buatlah sebuah proyek Flutter baru bernama my_profile_card.
2. Desain sebuah kartu profil sederhana yang menampilkan:
a. Foto profil (gunakan Image.network dari URL atau Image.asset jika
Anda punya gambar lokal).
b. Nama lengkap Anda (Text).
c. Profesi/Pekerjaan Anda (Text).
d. Tiga ikon media sosial (Icon) yang disusun secara horizontal (Row).
3. Gunakan Column untuk menyusun elemen-elemen ini secara vertikal.
4. Gunakan Container atau Card untuk membungkus seluruh kartu profil Anda,
berikan warna latar belakang dan sedikit padding.
5. Pastikan semua elemen terletak di tengah layar menggunakan Center
widget.
6. Eksplorasi penggunaan SizedBox untuk memberikan jarak antar widget jika
diperlukan.
7. Jalankan aplikasi Anda di emulator atau perangkat fisik, lalu buka Flutter
DevTools dan gunakan Widget Inspector untuk melihat struktur widget yang
telah Anda buat 
*/

class Bab4 extends StatelessWidget {
  const Bab4({super.key});

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
         Column(
          mainAxisAlignment: MainAxisAlignment.center, // Penataan vertikal
          crossAxisAlignment: CrossAxisAlignment.center, // Penataan horizontal (alignment)
          children: const [ // Daftar widget anak-anak
          Text('Yusuf Nawaf Albana'),
          Text('Pekerjaan : Siswa IDN'),
         ],
        ),
                Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Penataan vertikal
          children: const [
            Icon(Icons.home),
            Icon(Icons.settings),
            Icon(Icons.person),
          ],
        )

       ],
     ),
   ),
  );
 }
}
