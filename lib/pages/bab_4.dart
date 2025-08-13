import 'package:flutter/material.dart';

class Bab4 extends StatefulWidget {
  const Bab4({super.key});

  @override
  State<Bab4> createState() => _Bab4State();
}

class _Bab4State extends State<Bab4> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();
  String _hasil = '';

  void _hitung(String operator) {
    double? angka1 = double.tryParse(_angka1Controller.text);
    double? angka2 = double.tryParse(_angka2Controller.text);

    if (angka1 == null || angka2 == null) {
      setState(() {
        _hasil = 'Input harus berupa angka!';
      });
      return;
    }

    double hasil;
    switch (operator) {
      case '+':
        hasil = angka1 + angka2;
        break;
      case '-':
        hasil = angka1 - angka2;
        break;
      case 'x':
        hasil = angka1 * angka2;
        break;
      case '/':
        if (angka2 == 0) {
          setState(() {
            _hasil = 'Tidak bisa dibagi 0!';
          });
          return;
        }
        hasil = angka1 / angka2;
        break;
      default:
        hasil = 0;
    }

    setState(() {
      _hasil = 'Hasil: $hasil';
    });
  }

  @override
  void dispose() {
    _angka1Controller.dispose();
    _angka2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Sederhana'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _angka1Controller,
              decoration: const InputDecoration(
                labelText: 'Angka 1',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _angka2Controller,
              decoration: const InputDecoration(
                labelText: 'Angka 2',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _hitung('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('x'),
                  child: const Text('x'),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              _hasil,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}