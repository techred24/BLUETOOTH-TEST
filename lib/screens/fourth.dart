import 'package:flutter/material.dart';

class Fourth extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuarta Pagina')
      ),
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, 'home'),
          child: Text('Regresar a home')
        )
      ),
    );
  }
}