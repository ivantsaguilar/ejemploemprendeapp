import 'package:flutter/material.dart';
import 'RandomWords.dart';

class SplashScreenOne extends StatefulWidget {
  @override
  _SplashScreenOneState createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[900],
              gradient: LinearGradient(
                colors: [Colors.blue[900],Colors.blueAccent[700], Colors.lightBlue[100]],
                begin: Alignment.centerRight,
                end: new Alignment(-1.0, -1.0)
              )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                  Icons.euro_symbol,
                  color: Colors.white,
                  size: 80.0,
                ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Text(
                'Soluciones efectivas para tu negocio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}