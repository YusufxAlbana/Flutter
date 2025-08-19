// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const Bab5());
}

class Bab5 extends StatelessWidget {
  const Bab5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Catalog App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ProductListScreen(),
    );
  }
}

// Kelas Product
class Product {
  final String name;
  final double price;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.description,
  });
}

// Halaman Daftar Produk
class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final List<Product> products = [
    Product(
      name: "Apel Merah",
      price: 25000,
      description: "Apel merah segar, manis, dan kaya vitamin C. Cocok dimakan langsung atau dibuat jus.",
    ),
    Product(
      name: "Pisang Cavendish",
      price: 18000,
      description: "Pisang Cavendish yang lembut dan manis, kaya akan kalium dan serat.",
    ),
    Product(
      name: "Jeruk Medan",
      price: 22000,
      description: "Jeruk Medan terkenal dengan rasa manis segar dan kulit yang mudah dikupas.",
    ),
    Product(
      name: "Semangka",
      price: 30000,
      description: "Semangka segar ukuran besar, daging merah manis dan banyak air, cocok untuk cuaca panas.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("product catalog app"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            elevation: 2,
            child: ListTile(
              title: Text(product.name),
              subtitle: Text("Rp ${product.price.toStringAsFixed(0)} / kg"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Halaman Detail Produk
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Rp ${product.price.toStringAsFixed(0)} / kg",
              style: const TextStyle(
                  fontSize: 18, color: Colors.green, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Text(product.description),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Kembali ke Daftar"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
