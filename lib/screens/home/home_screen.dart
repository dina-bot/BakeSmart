import 'package:flutter/material.dart';
import 'dart:io'; // Untuk menangani file gambar
import 'package:image_picker/image_picker.dart'; // Untuk memilih gambar dari galeri

import 'components/discount_banner.dart';
import 'components/home_header.dart';
import 'components/popular_product.dart';
import '../../models/Product.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> _products = demoProducts; // List Produk yang sudah ada
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _image; // Variabel untuk menyimpan gambar yang dipilih

  // Function untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  // Function untuk menambahkan produk baru ke dalam list
  void _addNewProduct() {
    if (_titleController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _image == null) {
      return; // Pastikan semua field diisi
    }

    setState(() {
      _products.add(Product(
        id: _products.length + 1,
        title: _titleController.text,
        price: double.parse(_priceController.text),
        description: _descriptionController.text,
        images: [_image!.path],
        colors: [Colors.orange, Colors.blue, Colors.purple, Colors.white],
        isFavourite: false,
        isPopular: false,
        rating: 0.0,
      ));
    });

    // Bersihkan input form
    _titleController.clear();
    _priceController.clear();
    _descriptionController.clear();
    _image = null;

    // Tutup dialog
    Navigator.of(context).pop();
  }

  // Function untuk menampilkan dialog penambahan produk
  void _showAddProductDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown[50], // Warna latar belakang dialog
            title: const Text(
              "Add New Product",
              style: TextStyle(color: Colors.brown), // Warna teks judul
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Product Name TextField
                  SizedBox(
                    width: 300, // Atur lebar sesuai kebutuhan
                    child: TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: "Product Name",
                        labelStyle:
                            TextStyle(color: Colors.brown), // Warna label
                      ),
                      style: const TextStyle(color: Colors.brown), // Warna teks
                    ),
                  ),
                  const SizedBox(height: 10), // Jarak antara field
                  // Price TextField
                  SizedBox(
                    width: 300, // Atur lebar sesuai kebutuhan
                    child: TextField(
                      controller: _priceController,
                      decoration: const InputDecoration(
                        labelText: "Price",
                        labelStyle:
                            TextStyle(color: Colors.brown), // Warna label
                      ),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.brown), // Warna teks
                    ),
                  ),
                  const SizedBox(height: 10), // Jarak antara field
                  // Description TextField
                  SizedBox(
                    width: 300, // Atur lebar sesuai kebutuhan
                    child: TextField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: "Description",
                        labelStyle:
                            TextStyle(color: Colors.brown), // Warna label
                      ),
                      style: const TextStyle(color: Colors.brown), // Warna teks
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Image Upload Section
                  _image != null
                      ? Image.file(_image!, height: 100, width: 100)
                      : const Text('No image selected',
                          style: TextStyle(
                              color: Colors.brown)), // Ganti warna teks
                  TextButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.image, color: Colors.white),
                    label: const Text("Upload Image",
                        style: TextStyle(color: Colors.white)),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          Colors.brown, // Warna latar belakang cokelat
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  primary: Colors.white, // Warna teks tombol
                  backgroundColor: Colors.brown, // Warna latar belakang cokelat
                ),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: _addNewProduct,
                style: TextButton.styleFrom(
                  primary: Colors.white, // Warna teks tombol
                  backgroundColor: Colors.brown, // Warna latar belakang cokelat
                ),
                child: const Text("Add"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const HomeHeader(),
              const DiscountBanner(),
              PopularProducts(
                  products: _products), // Kirim produk yang ter-update
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddProductDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
