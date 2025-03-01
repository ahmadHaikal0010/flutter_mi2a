import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTiga extends StatelessWidget {
  const PageTiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Ini Page Tiga'),
      ),
    );
  }

}