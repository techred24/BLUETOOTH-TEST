import 'package:flutter_blue/flutter_blue.dart';
import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

class Indicador {

  static final Indicador _indicador = Indicador._internal();
  factory Indicador() {
    return _indicador;
  }
  Indicador._internal();

  BluetoothDevice dispositivoConectado;
  List<BluetoothDevice> dispositivos = [];
  List<BluetoothService> services = [];
  // String _identificador;

  FlutterBlue flutterBlue = FlutterBlue.instance;
  _agregaDispositivoHaciaLista(final BluetoothDevice device) {
    if (!dispositivos.contains(device)) {
      print('DISPOSITIVO AGREGADO');
      dispositivos.add(device);
      print(dispositivos.length);
      print('LONGITUD DE LOS DISPOSITIVOS AL MOMENTO DE AGREGAR');
      conectarDispositivo();
    }
  }
  // Se consigue el identificador. El número de la unidad, eje: U-1516
  // Future<String> _consigueIdentificador() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   String datosUnidad = prefs.getString('unidad');
  //   // _identificador = json.decode(datosUnidad)['identificador'];
  //   return json.decode(datosUnidad)['identificador'];
  // }
// TODO: Método para verificar si ya existen dispositivos conectados
  void buscaDispositivosConectados() {
    print('DENTRO DE BUSCAR DISPOSITIVOS CONECTADOS');
    flutterBlue.connectedDevices
      .asStream()
      .listen((List<BluetoothDevice> dispositivos) {
        print(dispositivos);
        print('LOS DISPOSITIVOS YA CONECTADOS');
        for (BluetoothDevice dispositivo in dispositivos) {
          // if (dispositivo.name == _identificador) {
            print(dispositivo.name);
            print('NOMBRE DEL DISPOSITIVO CONECTADO');
          if (dispositivo.name == 'Boletera-Apolo') {
            // _agregaDispositivoHaciaLista(dispositivo);
            dispositivoConectado = dispositivo;
            print('SE AGREGO EL DISPOSITIVO YA CONECTADO A LA VARIABLE');
            break;
          }
        }
      });
  }
// TODO: Método que buscará y agregará dispositivo a la lista de dispositivos
  // Future<List<BluetoothDevice>> buscaDispositivos() async {
  buscaDispositivos() async {
    print('METODO PARA BUSCAR DISPOSITIVOS INICIO');
    flutterBlue.startScan(timeout: Duration(seconds: 3));
    flutterBlue.scanResults.listen((results) async {
      // _identificador = await _consigueIdentificador();
      print(results);
      print('LOS DISPOSITIVOS DISPONIBLES PARA CONECTAR');
      for (ScanResult result in results) {
        print(result.device.name);
        print('NOMBRE DEL DISPOSITIVO A CONECTAR');
        // if (result.device.name == _identificador) {
        if (result.device.name == 'Boletera-Apolo') {
          _agregaDispositivoHaciaLista(result.device);
          break;
        }
      }
    });
    // flutterBlue.startScan();
    print('METODO PARA BUSCAR DISPOSITIVOS ANTES DEL RETURN');
  }
  
  // TODO:  Conectar dispotivo de la lista de dispositivos
  void conectarDispositivo() async {
    print('METODO PARA CONECTAR DISPOSITIVO INICIO');
    print(dispositivos.length);
    print('LA LONGITUD DEL ARRAY DE LOS DISPOSITIVOS');
    if (dispositivos.length > 0) {
        // flutterBlue.stopScan();
        for (final BluetoothDevice dispositivo in dispositivos) {
          await dispositivo.connect();
          // services = await dispositivo.discoverServices();
          dispositivoConectado = dispositivo;
          print(dispositivoConectado);
          print('EL DISPOSITIVO QUE SE CONECTO');
          break;
        }
    }
    print('METODO PARA CONECTAR DISPOSITIVO FIN');
  }

  void emitirSonido() async {
    List<BluetoothService> servicios = await dispositivoConectado.discoverServices();
    for (final BluetoothService servicio in servicios) {
      List<BluetoothCharacteristic> caracteristicas =  servicio.characteristics;
      for (BluetoothCharacteristic caracteristica in caracteristicas) {
        if (caracteristica.properties.write) {
          try {
            await caracteristica.write(utf8.encode('1'));
          } catch (e) {
            
          }
          break;
        }
      }
    }
  }

  void desconectar() {
    dispositivoConectado.disconnect();
    dispositivoConectado = null;
    dispositivos = [];
  }

}
