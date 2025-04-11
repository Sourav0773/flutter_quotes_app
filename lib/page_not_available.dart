import 'package:flutter/material.dart';

class PageNotAvailable extends StatelessWidget {
  const PageNotAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/page_not_found.gif',
          height: 200,
          width: 200,
          fit: BoxFit.contain
        ),
      ),
    );
  }
}