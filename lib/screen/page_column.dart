import 'package:flutter/material.dart';

class PageColumn extends StatelessWidget {
  const PageColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Page Column'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Secara horizontal
          crossAxisAlignment: CrossAxisAlignment.center, // Secara vertikal
          children: [
            Text('Ini adalah text 1'),
            Text('Ini adalah text 2'),
            Text('Ini adalah text 3'),
          ],
        ),
      ),
    );
  }
}
