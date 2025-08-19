/* 1. Buatlah sebuah proyek Flutter baru bernama my_gallery_app.
2. Di dalam proyek tersebut, buat sebuah daftar data dummy (misalnya
List<Map<String, String>>) yang berisi URL gambar dan judul untuk
beberapa foto. Contoh:
final List<Map<String, String>> photos = [
{'title': 'Pegunungan', 'url':
'https://picsum.photos/id/10/200/300'},
{'title': 'Kota Malam', 'url':
'https://picsum.photos/id/20/200/300'},
{'title': 'Hutan Kabut', 'url':
'https://picsum.photos/id/30/200/300'},
// ... tambahkan lebih banyak
];
3. Implementasikan halaman utama aplikasi Anda menggunakan
GridView.builder untuk menampilkan gambar-gambar tersebut dalam
format kisi.
a. Tentukan gridDelegate agar ada 2 atau 3 kolom gambar per baris.
b. Untuk setiap item kisi, tampilkan Image.network dan di bawahnya
Text judul gambar.
c. Berikan padding dan spacing yang sesuai agar tampilan lebih rapi.
4. Tambahkan fungsionalitas onTap pada setiap gambar di GridView sehingga
ketika gambar diketuk, aplikasi akan menavigasi ke halaman detail baru
(PhotoDetailScreen).
5. Pada PhotoDetailScreen, tampilkan gambar yang diketuk dalam ukuran
yang lebih besar dan judulnya. Pastikan Anda melewatkan URL gambar dan
judul ke halaman detail menggunakan konstruktor atau argumen rute.
6. Sertakan tombol "Kembali" di PhotoDetailScreen yang akan kembali ke
my_gallery_app. */


import 'package:flutter/material.dart';

class Bab6 extends StatelessWidget {
  const Bab6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Bab 6'),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: const ProductGridView(),
    );
  }
}

class ProductGridView extends StatelessWidget {
  final List<Map<String, String>> products = const [
    {
      'title': 'Pegunungan',
      'url': 'https://picsum.photos/id/10/200/300',
    },
    {
      'title': 'Kota Malam',
      'url': 'https://picsum.photos/id/20/200/300',
    },
    {
      'title': 'Hutan Kabut',
      'url': 'https://picsum.photos/id/30/200/300',
    },
    {
      'title': 'Hutan Kabut',
      'url': 'https://picsum.photos/id/30/200/300',
    },
    {
      'title': 'Kota Malam',
      'url': 'https://picsum.photos/id/20/200/300',
    },
    {
      'title': 'Pegunungan',
      'url': 'https://picsum.photos/id/10/200/300',
    },
  ];

  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri Produk'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 kolom
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.8,
        ),
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 3,
            child: InkWell(
              onTap: () {
                // Navigasi ke halaman detail
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoDetailScreen(
                      title: product['title']!,
                      url: product['url']!,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      product['url']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1, // Biar ga kepanjangan
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PhotoDetailScreen extends StatelessWidget {
  final String title;
  final String url;

  const PhotoDetailScreen({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.network(url, fit: BoxFit.cover),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // tombol kembali
              },
              child: const Text("Kembali"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
