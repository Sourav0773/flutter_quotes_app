import 'package:flutter/material.dart';
import 'package:quotes_app/Provider/provider.dart';
import 'package:quotes_app/Screens/QuoteScreen/quote_card.dart';
import 'package:provider/provider.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() {
    return LikeScreenState();
  }
}

class LikeScreenState extends State<LikeScreen> {
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
          padding: const EdgeInsets.only(left: 58),
          child: const Text(
            'Favourite Quotes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Consumer<QuoteAppProvider>(
        builder: (context, provider, child) {
          if (provider.likedQuotes.isEmpty) {
            return const Center(
              child: Text('Add your daily favourite quotes here ❤️'),
            );
          } else {
            return ListView.builder(
              itemCount: provider.likedQuotes.length,
              itemBuilder: (context, index) {
                final quote = provider.likedQuotes[index];
                return QuoteCard(
                  id: '${quote.id}',
                  quote: '${quote.quote}',
                  author: '~${quote.author}',
                  userLiked: quote.userLiked,
                  afterUserLiked: () => provider.afterUserLiked(quote),
                );
              },
            );
          }
        },
      ),
    );
  }
}
