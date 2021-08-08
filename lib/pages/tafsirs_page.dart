import 'package:flutter/material.dart';

class TafsirsPage extends StatefulWidget {
  const TafsirsPage({Key? key}) : super(key: key);

  @override
  _TafsirsPageState createState() => _TafsirsPageState();
}

class _TafsirsPageState extends State<TafsirsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Разъяснение имён'),
        centerTitle: true,
        backgroundColor: Colors.green[400],
      ),
      body: Container(
        color: Colors.green[50],
      ),
    );
  }
}
