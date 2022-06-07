import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Test'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, 'second'),
          child: Text('Ir a segunda vista')
        )
      ),
    );
  }
}