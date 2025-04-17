import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/Provider/provider.dart';
import 'package:intl/intl.dart';


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
            'Comment History',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Consumer<QuoteAppProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            itemCount: provider.comments.length,
            separatorBuilder: (context, index) => Divider(thickness: 0.5),
            itemBuilder: (context, index) {
              final comment = provider.comments[index];
              final formattedTime = DateFormat('yyyy-MM-dd - hh:mm a').format(comment['time']);

              return ListTile(
                leading: Text('${index + 1}.', style: TextStyle(fontSize: 15)),
                title: Text(comment['text']),
                subtitle: Text(
                  formattedTime,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
