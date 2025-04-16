import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes_app/Local_Storage/local_stroage_for_comments.dart';
import 'package:share_plus/share_plus.dart';

void copyQuote(String quote, String author) async {
  await Clipboard.setData(ClipboardData(text: "$quote\n$author"));
}

void shareQuote(String quote, String author) {
  Share.share("$quote\n$author");
}

void onComment(
  BuildContext context,
  String quoteID,
  TextEditingController controller,
) {
  showDialog(
    context: context,
    builder:
        (_) => AlertDialog(
          title: Text('Add Comment'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter your comment'),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await LocalStroageForComments.saveComments(
                  quoteID,
                  controller.text,
                  DateTime.now().toString(),
                  'user123', 
                );
                Navigator.pop(context);
              },
              child: Text('Post'),
            ),
          ],
        ),
  );
}
