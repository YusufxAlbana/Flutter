/* 1. Buatlah sebuah proyek Flutter baru bernama photo_viewer_app.
2. Gunakan API publik dari JSONPlaceholder untuk mengambil daftar foto:
https://jsonplaceholder.typicode.com/photos.
3. Buatlah kelas model Dart bernama Photo yang sesuai dengan struktur JSON
dari API tersebut (misalnya id, title, url, thumbnailUrl).
4. Implementasikan FutureBuilder di halaman utama Anda (HomeScreen atau
PhotoListScreen) untuk:
a. Menampilkan CircularProgressIndicator saat data sedang
dimuat.
b. Menampilkan pesan error jika terjadi kegagalan dalam mengambil
data.
c. Jika data berhasil dimuat, tampilkan daftar foto menggunakan
GridView.builder (dengan 2 atau 3 kolom). Setiap item GridView
harus menampilkan thumbnailUrl dan title dari foto.
5. Tambahkan fungsionalitas onTap pada setiap item GridView untuk
menavigasi ke halaman detail foto (PhotoDetailScreen).
6. Di PhotoDetailScreen, tampilkan url (gambar ukuran penuh) dan title dari
foto yang dipilih.
Tips:
● Gunakan Image.network() untuk menampilkan gambar dari URL.
● Pastikan Anda menangani snapshot.data yang bisa null sebelum mengakses
propertinya.
● Selalu periksa response.statusCode dari permintaan HTTP untuk
memastikan keberhasilan. */

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class Bab7 extends StatelessWidget {
  Bab7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Bab 7'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //pindah ke halaman lain
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PhotoViewerApp()),
            );
          }, child: const Text('Photo Viewer App')),
      ),
    );
  }
}

// permulaan bab 7
// Model Photo
class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

// Fetch data dari API
Future<List<Photo>> fetchPhotos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((photo) => Photo.fromJson(photo)).toList();
  } else {
    throw Exception('Gagal mengambil data foto');
  }
}

void main() {
  runApp(const PhotoViewerApp());
}

class PhotoViewerApp extends StatelessWidget {
  const PhotoViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Viewer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PhotoListScreen(),
    );
  }
}

class PhotoListScreen extends StatelessWidget {
  const PhotoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Foto')),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data'));
          } else {
            final photos = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 kolom
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PhotoDetailScreen(photo: photo),
                      ),
                    );
                  },
                  child: GridTile(
                    footer: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        photo.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    child: Image.network(
                      photo.thumbnailUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(photo.title)),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                photo.url,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 50, color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                photo.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}