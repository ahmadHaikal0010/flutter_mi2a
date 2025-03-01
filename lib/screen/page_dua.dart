import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PageDua extends StatelessWidget {
  const PageDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Ini Page Dua'),
      ),
    );
  }
}