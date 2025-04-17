import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black,
              child: Center(child: const Icon(Icons.arrow_back, color: Colors.white)),
            ),
          ),
        ),
        backgroundColor: Colors.amber,
        title: Padding(
          padding: const EdgeInsets.only(left: 55),
          child: const Text(
            'Comment Histroy',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
