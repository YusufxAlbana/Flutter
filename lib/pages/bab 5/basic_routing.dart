/* 
⁡⁣⁣⁢Navigator.push()⁡: Digunakan untuk mendorong rute baru ke atas
tumpukan (ke halaman lain).
⁡⁣⁣⁢Navigator.pop()⁡: Digunakan untuk menarik rute teratas dari tumpukan,
kembali ke halaman sebelumnya (balik ke halaman sebelumnya).
⁡⁣⁣⁢MaterialPageRoute⁡: Ini adalah kelas yang membuat rute yang mengambil
alih seluruh layar dengan transisi spesifik platform (misalnya, transisi geser
dari kanan ke kiri pada Android, atau dari bawah ke atas pada iOS).
*/

import 'package:flutter/material.dart';

// Halaman Pertama (basic_routing) - Stateless Widget
class basic_routing extends StatelessWidget {
const basic_routing({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Halaman Utama (basic route)'),
centerTitle: true, // supaya tulisan mx auto

backgroundColor: Colors.blueAccent,
),
body: Center(
child: ElevatedButton(
child: const Text('Pergi ke Halaman Kedua'),
onPressed: () {
// Menggunakan Navigator.push untuk berpindah halaman
Navigator.push(
context,
MaterialPageRoute(builder: (context) => const
halaman_kedua()), // Definisi rute ke halaman_kedua
);
},
),
),
);
}
}
// Halaman Kedua (halaman_kedua) - Stateless Widget
class halaman_kedua extends StatelessWidget {
const halaman_kedua({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Halaman Kedua'),
backgroundColor: Colors.greenAccent,
),
body: Center(
child: ElevatedButton(
child: const Text('Kembali ke Halaman Utama'),
onPressed: () {
// Menggunakan Navigator.pop untuk kembali ke halaman sebelumnya
Navigator.pop(context);
},
),
),
);
}
}
