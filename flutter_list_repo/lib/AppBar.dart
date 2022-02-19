import 'dart:html';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Application(),
  ));
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Appbar Widget'),
        leading: new Icon(Icons.menu),
      ),
    );
  }
}
