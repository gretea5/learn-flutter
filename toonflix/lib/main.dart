import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Hello flutter!'),
          titleTextStyle: TextStyle(
            fontStyle: FontStyle.normal,
          ),
        ),
        body: Center(
          child: Text('Hello world!'),
        ),
      ),
    );
  }
}
