import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

  void main() => runApp(MyApp()); // Primer widget

class MyApp extends StatelessWidget{ // No guarda su estado, entre cada actualización no conserva su estado
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp( // Segundo widget
      title: 'Emprende',
      home: RandomWords(),
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

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {

    //final wordPair = new WordPair.random();

    // return Text(wordPair.asPascalCase.toString());
    return Scaffold( // Tercer widget
        appBar: AppBar( // Cuarto widget
          title: Text('Emprende'),

        ),
        body: _buildSuggestions()
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemBuilder: (context, i){

        if(i.isOdd){
          return Divider();
        }

        if(i>= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(5)); // Agregarmos 5 palabras mas al acabarse la lista
        }

        final index = i ~/ 2;

        return _buildRow(_suggestions[index]); // Se genera el listview con todas las lapabras al tamaño de la pantalla
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
          pair.asPascalCase,
          style: _biggerFont,),
    );
  }

}