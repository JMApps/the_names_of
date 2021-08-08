import 'package:flutter/material.dart';

class NamesPage extends StatefulWidget {
  const NamesPage({Key? key}) : super(key: key);

  @override
  _NamesPageState createState() => _NamesPageState();
}

class _NamesPageState extends State<NamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список имён'),
        centerTitle: true,
        backgroundColor: Colors.red[400],
      ),
      body: Container(
        color: Colors.red[50],
      ),
    );
  }
}
