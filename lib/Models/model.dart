class QuoteDataModel {
  int? id;
  String? quote;
  String? author;
  bool userLiked;

  QuoteDataModel({this.id, this.quote, this.author, this.userLiked = false});

  factory QuoteDataModel.fromJson(Map<String, dynamic> json) {
    return QuoteDataModel(
      id: json['id'],
      quote: json['quote'],
      author: json['author'],
    );
  }
}
