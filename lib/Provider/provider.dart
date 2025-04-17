import 'package:flutter/material.dart';
import 'package:quotes_app/API/api.dart';
import 'package:quotes_app/Models/model.dart';

class QuoteAppProvider extends ChangeNotifier {
  final List<QuoteDataModel> quotes = [];
  final List<QuoteDataModel> likedQuotes = [];

  final List<Map<String, dynamic>> comments = [];

  int currentPage = 1;
  bool isLoading = false;
  bool hasMoreData = true;

  final TextEditingController commentController = TextEditingController();

  ////////////////////////////////
  // Fetch Quotes with pagination/
  ////////////////////////////////
  Future<void> fetchQuotes({int limit = 10}) async {
    if (isLoading || !hasMoreData) {
      return;
    }

    isLoading = true;
    notifyListeners();

    // Fetch new quotes
    final newQuotes = await quoteAPI(page: currentPage, limit: limit);
    quotes.addAll(newQuotes);
    currentPage++;
    hasMoreData = newQuotes.length == limit;
    isLoading = false;

    notifyListeners();
  }

  ///////////////////////////////////////
  // Like or Unlike a Quote//////////////
  ///////////////////////////////////////
  void afterUserLiked(QuoteDataModel quote) {
    quote.userLiked = !quote.userLiked;
    if (quote.userLiked) {
      likedQuotes.add(quote);
    } else {
      likedQuotes.remove(quote);
    }
    notifyListeners();
  }

  /////////////////////////////////
  //On post////////////////////////
  /////////////////////////////////
  void onPost(BuildContext context) {
    String comment = commentController.text.trim();
    if (comment.isNotEmpty) {
      comments.add({'text': comment, 'time': DateTime.now()});
      //print('commnet posted succesfully $comment');
      commentController.clear();
      notifyListeners();
      Navigator.of(context).pop();
    }
  }
}
