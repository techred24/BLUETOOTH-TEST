import 'package:flutter/material.dart';
import 'package:bluetooth/screens/screens.dart';

main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({Key key}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home'    :   (context) => Home(),
        'second'  :   (context) => Second(),
        'third'   :   (context) => Third(),
        'fourth'  :   (context) => Fourth()
      },
    );
  }
}