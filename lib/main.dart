import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

  void main() => runApp(MyApp()); // Primer widget

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final wordPair = new WordPair.random();

    return MaterialApp( // Segundo widget
      title: 'Emprende',
      home: Scaffold( // Tercer widget
        appBar: AppBar( // Cuarto widget
          title: Text('Emprende'),

        ),
        body: Center(
          child: Text(wordPair.asPascalCase.toString()),
        )
      ),
    );
  }
}
