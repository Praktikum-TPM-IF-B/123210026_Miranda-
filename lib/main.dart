import 'package:flutter/material.dart';
import 'package:kuis_123210026/login_page.dart';
import 'package:kuis_123210026/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPNVY E-Learning',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const LoginPage(),
    );
  }
}
