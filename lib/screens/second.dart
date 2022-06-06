import 'package:flutter/material.dart';

class Second extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pagina')
      ),
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, 'third'),
          child: Text('Ir a tercera vista')
        )
      ),
    );
  }
}