import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: _pushSaved,
            ),
            IconButton(
              icon: Icon(Icons.add_a_photo),
              onPressed: _pushSaved,
            )
          ],
        ),
        body: _buildSuggestions()
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) {
              final tiles = _saved.map((pair){ // Objeto pareja de palabras, listado de listtiles
                return ListTile(
                  title: Text(
                    pair.asPascalCase.toString(),
                    style: _biggerFont,
                  ),
                );
              });// Widget que va a abrirse al dar click en la lista (Pantalla de las palabras seleccionadas)

              final divided = ListTile.divideTiles(context: context, tiles: tiles).toList();

              return Scaffold( // Regresamos la ruta y lo que vamos a mostrar
                appBar: AppBar(
                  title: Text("Listado"),
                ),
                body: ListView(children: divided,
                ),
              );
            }
        )
    ); // Nos vamos a la nueva ruta
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