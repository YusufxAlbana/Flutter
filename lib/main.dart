import 'package:flutter/material.dart';
import 'pages/bab_2.dart';
import 'pages/bab_3.dart';
import 'pages/bab_4.dart';
import 'pages/bab_5.dart';
import 'pages/bab_6.dart';
import 'pages/bab_7.dart';
import 'pages/bab_8.dart'; 
import 'pages/bab_9.dart';
import 'pages/bab 5/basic_routing.dart';
import 'pages/bab 5/named_route.dart';
import 'pages/bab 5/passing_data_antar_halaman.dart';
import 'pages/bab 5/melalui_argumen.dart';
import 'pages/bab 5/mengembalikan_data_dari_halaman_yang_di-pop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'Bab2': (context) => const Bab2(),
        'Bab3': (context) => const Bab3(),
        'Bab4': (context) => const Bab4(),
        'Bab5': (context) => Bab5(),
        'Bab6': (context) => Bab6Asli(),
        'Bab7': (context) => Bab7(),
        'Bab8': (context) => const Bab8(), 
        'Bab9': (context) => Bab9(), 

        // bab 5 rincian materi
        'BR': (context) => const basic_routing(),
        'NR': (context) => namedRoute(),
        'PDAH': (context) => const halaman_pertama(),
        'MA': (context) => MelaluiArgumen(),
        'MDDHYDP': (context) => const halamanUtama(),
      },
    );
  }
}
