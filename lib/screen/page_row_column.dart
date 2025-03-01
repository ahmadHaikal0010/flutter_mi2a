import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageRowColumn extends StatelessWidget {
  const PageRowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Row Column'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 35, color: Colors.red),
                Text('Home'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.spa, size: 35, color: Colors.green),
                Text('Spa'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.accessibility, size: 35, color: Colors.blue),
                Text('Accessibility'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
