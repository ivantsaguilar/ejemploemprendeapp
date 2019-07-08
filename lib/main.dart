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
  final _saved = Set<WordPair>(); // En Set no puede haber elementos repetidos pero en una lista si, es por eso que lo usaremos para guardar los likes
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

        return _buildRow(_suggestions[index]); // Se genera el listview con todas las pabras al tamaño de la pantalla
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
          pair.asPascalCase,
          style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border, // (?) Si alreadySaved tiene el elemento se pone el favorite y si no esta (:) ponemos el favoriteborder
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() { // Funcion principal en los stateful widget
          if(alreadySaved){
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

}