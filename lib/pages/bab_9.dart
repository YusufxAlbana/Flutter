import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bab9 extends StatelessWidget {
  Bab9({super.key});

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
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          }, child: const Text('Photo Viewer App')),
      ),
    );
  }
}

// MODEL
class Photo {
  final String title;
  final String url;

  Photo({required this.title, required this.url});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      title: json['title'] ?? 'No Title',
      url: json['url'] ?? '',
    );
  }
}

// CONTROLLER
class PhotoController extends GetxController {
  var photos = <Photo>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos?_limit=12'));

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        photos.value = data.map((json) => Photo.fromJson(json)).toList();
      } else {
        errorMessage.value = 'Gagal memuat data (${response.statusCode})';
      }
    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan: $e';
    } finally {
      isLoading.value = false;
    }
  }
}

// MAIN
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Bab 6 Refactor',
      home: const Bab6(),
    );
  }
}

// UI
class Bab6 extends StatelessWidget {
  const Bab6({super.key});

  @override
  Widget build(BuildContext context) {
    final PhotoController controller = Get.put(PhotoController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Bab 6 (GetX)'),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        return GridView.builder(
          itemCount: controller.photos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.8,
          ),
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (context, index) {
            final photo = controller.photos[index];
            return Card(
              elevation: 3,
              child: InkWell(
                onTap: () {
                  Get.to(() => PhotoDetailScreen(
                        title: photo.title,
                        url: photo.url,
                      ));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(
                        photo.url,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        photo.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
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
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text("Kembali"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
