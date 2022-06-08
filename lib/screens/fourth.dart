import 'package:flutter/material.dart';
import 'package:bluetooth/bluetooth.dart';

class Fourth extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuarta Pagina')
      ),
      body: Center(
        child: TextButton(
          onPressed: () => displayDialog(context),
          child: Text('Abrir modal')
        )
      ),
    );
  }
}

void displayDialog(BuildContext context) {
  Indicador indicador = Indicador();
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(10)),
        title: Text('Emisor de sonido'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            Text('Emitir Sonido'),
            SizedBox(height: 10),
          ]
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar')
          ),
          TextButton(
            onPressed:  ()  {
                print('onPressed');
                if (indicador.dispositivoConectado != null) {
                  print(indicador.dispositivoConectado.state);
                  print('EL DISPOSITIVO. ESTADO');
                  print('INSIDE IF TO ISSUE SOUND');
                  try {
                    indicador.emitirSonido();
                  } catch (e) {
                    print(e);
                    print('DENTRO DEL CATCH');
                  }
                } else {
                  print('INSIDE ELSE');
                }
            },
            child: Text('Emitir')
          )
        ],
      );
    }
  );
}