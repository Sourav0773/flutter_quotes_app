import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/Provider/provider.dart';
import 'package:share_plus/share_plus.dart';

//Copy
void copyQuote(String quote, String author) async {
  await Clipboard.setData(ClipboardData(text: "$quote\n$author"));
}

//Share
void shareQuote(String quote, String author) async {
  await Share.share("$quote\n$author");
}

//Comment
Future<void> onComment(BuildContext context) async {
  final provider = Provider.of<QuoteAppProvider>(context, listen: false);

  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text('comments..'),
        content: TextField(
          controller: provider.commentController,
          decoration: InputDecoration(
            hintText: "Add your comment",
            border: InputBorder.none,
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => provider.onPost(context),
            child: Text('POST'),
          ),
          TextButton(
            onPressed: () => 
            Navigator.of(context).pop(),
            child: Text('CANCEL', style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}
