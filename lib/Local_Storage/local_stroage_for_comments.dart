import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStroageForComments {
  static const String key = '';

  static Future<void> saveComments(String quoted, String commentTexts, dynamic commentText, dynamic quoteID) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getString(key);
    List comments = existing != null ? jsonDecode(existing) : [];

    comments.add({
      'quoteID': quoteID,
      'comment': commentText,
      'timeStamp': DateTime.now().toIso8601String(),
    });

    await prefs.setString(key, jsonEncode(comments));
  }

  static Future<List<Map<String, dynamic>>> getComments() async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getString(key);
    return existing != null
        ? List<Map<String, dynamic>>.from(jsonDecode(existing))
        : [];
  }
}
