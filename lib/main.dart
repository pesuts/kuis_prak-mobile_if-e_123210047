import 'package:flutter/material.dart';
import 'package:kuis_123210047/Views/ListItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListItem(),
    );
  }
}
