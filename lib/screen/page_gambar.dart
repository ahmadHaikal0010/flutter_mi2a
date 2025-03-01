import 'package:flutter/material.dart';

class PageGambar extends StatelessWidget {
  const PageGambar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple, title: Text('Cat')),
      // buat directory gambar
      // masukkan gambar dan rename yang lebih sederhana
      // update pupspec.yaml
      // kita pub get atau pub upgrade
      body: Center(
        child: Image.asset('gambar/cat2.jpg'),
      ),
    );
  }
}
