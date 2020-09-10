import 'file:///F:/DartApps/bitcoin_tracker/lib/layouts/telaPrecos.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        cardColor: Colors.pink,
        primaryColor: Colors.pink,
        accentColor: Colors.pink,
        scaffoldBackgroundColor: Color(0xFF1B233A),
      ),
      home: TelaPrecos(),
    );
  }
}
