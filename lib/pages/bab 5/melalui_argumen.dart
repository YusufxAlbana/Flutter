import 'package:flutter/material.dart';
Widget MelaluiArgumen() {
return MaterialApp(
home: const HomeScreenNamedData(),
routes: {
'/detailWithArgs': (context) => const DetailScreenWithArgs(),
},
);
}
// Halaman Pertama (HomeScreenNamedData) - Mengirim Data via Arguments
class HomeScreenNamedData extends StatelessWidget {
const HomeScreenNamedData({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Home (Melalui Argumen)'),
centerTitle: true, // supaya tulisan mx auto
backgroundColor: Colors.blueAccent,
),
body: Center(
child: ElevatedButton(
child: const Text('Lihat Detail Produk'),
onPressed: () {
// Mengirim data menggunakan properti arguments
Navigator.pushNamed(
context,
'/detailWithArgs',
arguments: {
'productId': 123,
'productName': 'Laptop Gaming',
'price': 1500.00,
},
);
},
),
),
);
}
}
// Halaman Detail (DetailScreenWithArgs) - Menerima Data via Arguments
class DetailScreenWithArgs extends StatelessWidget {
const DetailScreenWithArgs({super.key});

@override
Widget build(BuildContext context) {
// Mengakses data yang dilewatkan melalui arguments
// arguments bisa null, jadi pastikan penanganan null
final Map<String, dynamic>? args =
ModalRoute.of(context)!.settings.arguments as
Map<String, dynamic>?;
final int? productId = args?['productId'];
final String? productName = args?['productName'];
final double? price = args?['price'];
return Scaffold(
appBar: AppBar(
title: const Text('Detail Produk'),
backgroundColor: Colors.purpleAccent,
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text('ID Produk: ${productId ?? "N/A"}', style:
const TextStyle(fontSize: 20)),
Text('Nama: ${productName ?? "N/A"}', style:
const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
Text('Harga: \$${price?.toStringAsFixed(2) ??
"N/A"}', style: const TextStyle(fontSize: 18)),
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
