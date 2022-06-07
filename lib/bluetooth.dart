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
  // BluetoothDevice _dispositivo;
  List<BluetoothDevice> dispositivos = [];
  List<BluetoothDevice> disposivitosConectados = [];
  List<BluetoothService> services = [];
  String _identificador;
  bool hayDispositivosConectados = false;
  bool hayDispositivoConectado = false;
  bool hayErrorEnConexion = false;

  FlutterBlue flutterBlue = FlutterBlue.instance;
  _agregaDispositivoHaciaLista(final BluetoothDevice device) {
    if (!dispositivos.contains(device)) {
      print('DISPOSITIVO AGREGADO');
      dispositivos.add(device);
    }
  }
// TODO: Método para verificar si ya existen dispositivos conectados
  void buscaDispositivosConectados() {
    flutterBlue.connectedDevices
      .asStream()
      .listen((List<BluetoothDevice> dispositivos) {
        for (BluetoothDevice dispositivo in dispositivos) {
          // if (dispositivo.name == _identificador) {
          // if (dispositivo.name == 'Boletera-Apolo') {
            _agregaDispositivoHaciaLista(dispositivo);
          // }
        }
      });
      if (dispositivos.length > 0) hayDispositivosConectados = true;
      hayDispositivosConectados = false;
  }
// TODO: Método que buscará y agregará dispositivo a la lista de dispositivos
  void buscaDispositivos() {
    print('BUSCANDO DISPOSITIVOS');
    flutterBlue.startScan(timeout: Duration(seconds: 3));
    flutterBlue.scanResults.listen((results) async {
      print(results);
      print('RESULTADOS');
      for (ScanResult result in results) {
        print(result);
        print('RESULTADO');
        // if (result.device.name == 'Boletera-Apolo') {
          _agregaDispositivoHaciaLista(result.device);
        // }
      }
    });
  }
  
  // TODO:  Conectar dispotivo de la lista de dispositivos
  void conectarDispositivo() async {
    print('${dispositivos.length} LA LOGITUD DEL ARRAY DE DISPOSITIVOS');
    if (dispositivos.length > 0) {
        for (final BluetoothDevice dispositivo in dispositivos) {
          await dispositivo.connect();
          print('CONECTANDO DISPOSITIVO');
          // services = await dispositivo.discoverServices();
          dispositivoConectado = dispositivo;
          break;
        }
    }
  }

  void emitirSonido() async {
    print('DENTRO DE EMITIR SONIDO');
    // if (!hayErrorEnConexion) {
      List<BluetoothDevice> connectedDevices = [];
      // BluetoothDevice connectedOne;
      flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> dispositivos) {
            for (BluetoothDevice dispositivo in dispositivos) {
                // if (dispositivo.name == _identificador) {
              if (dispositivo.name == 'Boletera-Apolo') {
                // _agregaDispositivoHaciaLista(dispositivo);
                if (!connectedDevices.contains(dispositivo)) {
                  connectedDevices.add(dispositivo);
                }
              }
            }
        });
      
      if (connectedDevices.length > 0) {
        for (final BluetoothDevice device in connectedDevices) {
          List<BluetoothService> services = await device.discoverServices();
          for(final BluetoothService service in services) {
            List<BluetoothCharacteristic> characteristics = service.characteristics;
            for (final BluetoothCharacteristic characteristic in characteristics) {
              if (characteristic.properties.write) {
                characteristic.write(utf8.encode('1'));
                break;
              }
            }
          }
        }
      }
    // }
  }
}
