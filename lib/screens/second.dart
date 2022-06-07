import 'package:flutter/material.dart';
import 'package:bluetooth/bluetooth.dart';

class Second extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Indicador indicador = Indicador();
    indicador.buscaDispositivosConectados();
    if (!indicador.hayDispositivosConectados) {
      indicador.buscaDispositivos();
      indicador.conectarDispositivo();
    }
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