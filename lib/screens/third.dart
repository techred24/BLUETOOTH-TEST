import 'package:flutter/material.dart';

class Third extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tercera Pagina')
      ),
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, 'fourth'),
          child: Text('Ir a cuarta vista')
        )
      ),
    );
  }
}