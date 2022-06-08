import 'package:flutter/material.dart';
import 'package:bluetooth/bluetooth.dart';

class Second extends StatelessWidget {

  Indicador indicador = Indicador();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pagina')
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Navigator.pushNamed(context, 'third'),
              child: Text('Ir a tercera vista')
            ),
            TextButton(
              onPressed: () {
                indicador.buscaDispositivosConectados();
                indicador.buscaDispositivos();
              },
              child:  Text('CONECTAR A BLUETOOTH')
            )
          ]
        )
      ),
    );
  }
}