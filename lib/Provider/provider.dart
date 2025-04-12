import 'package:flutter/material.dart';
import 'package:quotes_app/API/api.dart';
import 'package:quotes_app/Models/model.dart';

class QuoteAppProvider extends ChangeNotifier{
  final List<QuoteDataModel> quotes = []; //Storing quotes after fetching from api
  final List<QuoteDataModel> likedQuotes = []; //Storing quotes after user liked it
  int  currentPage = 1;
  bool isLoading = false;
  bool hasMoreData = true;

  //Lazy loading
  Future<void> fetchQuotes({int limit = 10}) async {
    if (isLoading || !hasMoreData) return;

    isLoading = true;
    notifyListeners();

    final newQuotes = await quoteAPI(page: currentPage, limit: limit);
     quotes.addAll(newQuotes); //adds newly added list object of quotes to the end of the list
     currentPage++;
     hasMoreData = newQuotes.length == limit;
     isLoading = false;
    notifyListeners();
  }
  
  //User liked
  void afterUserLiked(QuoteDataModel quote) {
    quote.userLiked = !quote.userLiked;
    if (quote.userLiked) {
       likedQuotes.add(quote);
    } else {
       likedQuotes.remove(quote);
    }
    notifyListeners();
  }
}