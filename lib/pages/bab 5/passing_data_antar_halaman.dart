/*
⁡⁣⁣⁢Definisikan Rute di MaterialApp⁡: Di widget MaterialApp Anda, tambahkan
properti routes. Ini adalah Map yang memetakan nama rute (berupa String)
ke fungsi builder yang mengembalikan widget halaman (bisa bikin URL sendiri).
⁡⁣⁣⁢Berpindah dengan Navigator.pushNamed()⁡: Gunakan
Navigator.pushNamed() dengan nama rute yang telah Anda definisikan.
*/

import 'package:flutter/material.dart';
void passingDataAntarHalaman() {
runApp(MaterialApp(
home: const halaman_pertama(), // Halaman awal aplikasi
routes: {
  // Tidak perlu mendefinisikan '/detail' di sini
},
));
}
// Halaman Pertama (halaman_pertama)
class halaman_pertama extends StatelessWidget {
const halaman_pertama({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Halaman Utama (Kirim Data)'),
centerTitle: true, // supaya tulisan mx auto
backgroundColor: Colors.blueAccent,
),
body: Center(
child: ElevatedButton(
child: const Text('Pergi ke Halaman Detail Buku'),
onPressed: () {
String bookTitle = "The Hobbit";
String authorName = "J.R.R. Tolkien";
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => DetailScreen(
title: bookTitle,
author: authorName,
),
),
);
},
),
),
);
}
}

// Halaman Kedua (SecondScreenNamed)
class DetailScreen extends StatelessWidget {
final String title; // Properti untuk menerima judul
final String author; // Properti untuk menerima penulis
const DetailScreen({super.key, required this.title,
required this.author});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Detail Buku'),

backgroundColor: Colors.purpleAccent,
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
'Judul: $title', // Menampilkan data yang diterima
style: const TextStyle(fontSize: 24,
fontWeight: FontWeight.bold),
),
Text(
'Penulis: $author',
style: const TextStyle(fontSize: 18),
),
const SizedBox(height: 30),
ElevatedButton(
child: const Text('Kembali'),
onPressed: () {
Navigator.pop(context);
},
),
],
),
),
);
}
}

// Pastikan runApp() di main.dart memanggil HomeScreen sebagai home
// void main() {
// runApp(const MaterialApp(
// home: HomeScreen(),
// ));
// }
