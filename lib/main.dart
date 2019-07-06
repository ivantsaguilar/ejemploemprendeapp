import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

  void main() => runApp(MyApp()); // Primer widget

class MyApp extends StatelessWidget{ // No guarda su estado, entre cada actualización no conserva su estado
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
          //child: Text(wordPair.asPascalCase.toString()),
          child: RandomWords(),
        )
      ),
    );
  }
}


class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWordsState();
  }

}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {

    final wordPair = new WordPair.random();

    return Text(wordPair.asPascalCase.toString());
  }

}