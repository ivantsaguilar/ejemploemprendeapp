import 'package:flutter/material.dart';
import 'splash_screen_one.dart';
import 'RandomWords.dart';

  void main() => runApp(MyApp()); // Primer widget

class MyApp extends StatelessWidget{ // No guarda su estado, entre cada actualización no conserva su estado
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp( // Segundo widget
      //debugShowCheckedModeBanner: false,
      title: 'Emprende',
      theme: ThemeData( //Personalización del tema
        primaryColor: Colors.blue[900],
      ),
      //home: RandomWords(),
      home: RandomWords(),
    );
  }
}