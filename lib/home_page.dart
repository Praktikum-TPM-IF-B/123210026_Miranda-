import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UPNVY E-Learning - Home'),
      ),
      body: Center(
        child: Text(
          'Selamat datang di UPNVY E-Learning!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
