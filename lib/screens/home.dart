import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
class Home extends StatelessWidget {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  @override
  Widget build(BuildContext context) {
    // flutterBlue.startScan(timeout: Duration(seconds: 8));
    // flutterBlue.scanResults.listen((results) async {
    //   print(results);
    //   print('LOS DISPOSITIVOS DISPONIBLES PARA CONECTAR');
    //   for (ScanResult result in results) {
    //     print(result.device.name);
    //     print('NOMBRE DEL DISPOSITIVO A CONECTAR');
    //     // if (result.device.name == _identificador) {
    //     if (result.device.name == 'Boletera-Apolo') {
    //       break;
    //     }
    //   }
    // });
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