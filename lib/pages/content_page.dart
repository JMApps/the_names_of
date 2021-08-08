import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Изложение основ'),
        centerTitle: true,
        backgroundColor: Colors.orange[400],
      ),
      body: Container(
        color: Colors.orange[50],
      ),
    );
  }
}
