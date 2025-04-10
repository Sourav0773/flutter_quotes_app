import 'package:flutter/material.dart';
import 'package:quotes_app/api.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() {
    return QuoteScreenState();
  }
}

class QuoteScreenState extends State<QuoteScreen> {
  
  @override
  void initState() {
    super.initState;
    quoteAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Famous Quotes by Famous People'),
      ),
    );
  }
}
