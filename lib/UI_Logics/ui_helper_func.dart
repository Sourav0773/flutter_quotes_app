import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

void copyQuote(String quote, String author) async {
  await Clipboard.setData(ClipboardData(text: "$quote\n$author"));
}

void shareQuote(String quote, String author) {
  Share.share("$quote\n$author");
}
