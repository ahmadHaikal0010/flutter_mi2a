import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PageDetailBerita extends StatelessWidget {
  final Map<String, dynamic> itemBerita;

  const PageDetailBerita(this.itemBerita, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(itemBerita['judul'])),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  '${itemBerita['gambar']}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
              ),
              SizedBox(height: 15),
              Text(itemBerita['judul']),
              Text(itemBerita['tanggal']),
              RatingBarIndicator(
                rating: itemBerita['rating'],
                itemBuilder:
                    (context, index) => Icon(Icons.star, color: Colors.yellow),
                itemCount: 5,
                itemSize: 15,
              ),
              Text(itemBerita['isi']),
            ],
          ),
        ),
      ),
    );
  }
}
