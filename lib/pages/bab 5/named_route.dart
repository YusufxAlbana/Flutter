/*
⁡⁣⁣⁢Definisikan Rute di MaterialApp⁡: Di widget MaterialApp Anda, tambahkan
properti routes. Ini adalah Map yang memetakan nama rute (berupa String)
ke fungsi builder yang mengembalikan widget halaman (bisa bikin URL sendiri).
⁡⁣⁣⁢Berpindah dengan Navigator.pushNamed()⁡: Gunakan
Navigator.pushNamed() dengan nama rute yang telah Anda definisikan.
*/

import 'package:flutter/material.dart';
Widget namedRoute() {
  return MaterialApp(
    home: const HomeScreen(),
    routes: {
      '/second': (context) => const SecondScreenNamed(),
      '/third': (context) => const ThirdScreenNamed(),
    },
  );
}

// Halaman Pertama (HomeScreen)
class HomeScreen extends StatelessWidget {
const HomeScreen({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Halaman Utama (Named Routes)'),
centerTitle: true, // supaya tulisan mx auto

backgroundColor: Colors.blueAccent,
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ElevatedButton(
child: const Text('Pergi ke Halaman Kedua'),
onPressed: () {
// Berpindah menggunakan named route
Navigator.pushNamed(context, '/second');
},
),
const SizedBox(height: 10),
ElevatedButton(
child: const Text('Pergi ke Halaman Ketiga'),
onPressed: () {
Navigator.pushNamed(context, '/third');
},
),
],
),
),
);
}
}
// Halaman Kedua (SecondScreenNamed)
class SecondScreenNamed extends StatelessWidget {
const SecondScreenNamed({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Halaman Kedua (Named)'),
backgroundColor: Colors.greenAccent,
),
body: Center(
child: ElevatedButton(
child: const Text('Kembali'),
onPressed: () {
Navigator.pop(context);
},

),
),
);
}
}
// Halaman Ketiga (ThirdScreenNamed)
class ThirdScreenNamed extends StatelessWidget {
const ThirdScreenNamed({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Halaman Ketiga (Named)'),
backgroundColor: Colors.orangeAccent,
),
body: Center(
child: ElevatedButton(
child: const Text('Kembali'),
onPressed: () {
Navigator.pop(context);
},
),
),
);
}
}