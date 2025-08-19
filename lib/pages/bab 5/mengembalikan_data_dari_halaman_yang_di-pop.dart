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
// lib/main.dart (contoh gabungan dengan Basic Routing)
// Halaman Pertama (halamanUtama) - Menerima data dari halaman kedua

class halamanUtama extends StatefulWidget {
const halamanUtama({super.key});
@override
State<halamanUtama> createState() => _halamanUtamaState();
}
class _halamanUtamaState extends State<halamanUtama> {
String _selectedItem = 'Belum ada item dipilih';
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Halaman Utama (Terima Data)'),
backgroundColor: Colors.blueAccent,
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
'Item Dipilih: $_selectedItem',
style: const TextStyle(fontSize: 20),
),
const SizedBox(height: 20),
ElevatedButton(
child: const Text('Pilih Item'),
onPressed: () async {
// Navigator.push mengembalikan Future.
// Kita bisa menunggu hasilnya menggunakan await.
final String? result = await Navigator.push(
context,
MaterialPageRoute(builder: (context) => const SelectionScreen()),
);
// Perbarui state setelah data diterima
if (result != null) {
setState(() {
_selectedItem = result;
});
}
},
),
],
),
),
);
}
}

// Halaman Pilihan (SelectionScreen) - Mengembalikan data saat di-pop
class SelectionScreen extends StatelessWidget {
const SelectionScreen({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Pilih Item'),
backgroundColor: Colors.orangeAccent,
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ElevatedButton(
child: const Text('Pilih "Apel"'),
onPressed: () {
// Mengembalikan nilai "Apel" saat pop
Navigator.pop(context, 'Apel');
},
),
const SizedBox(height: 10),
ElevatedButton(
child: const Text('Pilih "Pisang"'),
onPressed: () {
// Mengembalikan nilai "Pisang" saat pop
Navigator.pop(context, 'Pisang');
},
),
],
),
),
);
}
}