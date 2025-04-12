import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/Screens/home_screen.dart';
import 'package:quotes_app/Provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => QuoteAppProvider(),
      child: const QuotesApp(),
    )
  );
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
