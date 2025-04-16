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
              child: Center(
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
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
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CommentHistoryItem(
            quoteID: '109',
            comment: 'It triggers a good memory in my brain jbkkkkkkkk hbjjjjjjjn kbkjbkb vkbubkbbj ubkibkb xtrstdg gkugk',
            timestamp: '21:06',
          );
        },
      ),
    );
  }
}

class CommentHistoryItem extends StatelessWidget {
  final String quoteID;
  final String comment;
  final String timestamp;

  const CommentHistoryItem({
    super.key,
    required this.quoteID,
    required this.comment,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color.fromARGB(255, 230, 227, 227),
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // aligns top of text
        children: [
          // Left block with quoteID initial
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: const Color.fromARGB(255, 229, 226, 226),
            ),
            child: Center(
              child: Text(
                quoteID.substring(0, 1).toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          // Comment + Timestamp section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  timestamp,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
