import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 4'),
      ),
      body: Center(
        child: Text(
          'This is Page 4',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
