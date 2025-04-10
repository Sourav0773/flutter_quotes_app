import 'package:flutter/material.dart';
import 'package:quotes_app/home_screen.dart';

void main() {
  runApp(QuotesApp());
}

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
