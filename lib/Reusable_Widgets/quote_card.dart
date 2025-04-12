import 'package:flutter/material.dart';
import 'package:quotes_app/UI_Logics/ui_helper_func.dart';

class QuoteCard extends StatelessWidget {
  final String id;
  final String quote;
  final String author;
  final bool userLiked;
  final VoidCallback afterUserLiked;

  const QuoteCard({
    super.key,
    required this.id,
    required this.quote,
    required this.author,
    required this.userLiked,
    required this.afterUserLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),

        //Text body UI
        Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width * 0.93,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 7,
                color: Colors.black.withOpacity(0.8),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.black,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //ID
              Text(
                id,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.purpleAccent,
                ),
              ),

              const SizedBox(height: 8),

              // Main quote
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Text(
                  quote,
                  style: const TextStyle(fontSize: 17, color: Colors.green),
                ),
              ),

              const SizedBox(height: 10),

              // Author
              Text(
                author,
                style: const TextStyle(fontSize: 15, color: Colors.red),
              ),
            ],
          ),
        ),

        //Bottom button bar
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.93,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.5),
              ),
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: Colors.white,
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Review button
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.rate_review_outlined),
              ),

              //Copy button
              IconButton(
                onPressed: () => copyQuote(quote, author),
                icon: const Icon(Icons.copy),
              ),

              //Like button
              IconButton(
                onPressed: afterUserLiked,
                icon: Icon(
                  userLiked ? Icons.favorite : Icons.favorite_outline,
                  color: userLiked ? Colors.red : Colors.black,
                ),
              ),

              //Share button
              IconButton(
                onPressed: () => shareQuote(quote, author),
                icon: const Icon(Icons.share),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
