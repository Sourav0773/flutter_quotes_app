import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/Screens/QuoteScreen/quote_card.dart';
import 'package:quotes_app/Provider/provider.dart';

class PaginationLoading extends StatefulWidget {
  final int limit;

  const PaginationLoading({super.key, this.limit = 10});

  @override
  State<PaginationLoading> createState() {
    return PaginationLoadingState();
  }
}

class PaginationLoadingState extends State<PaginationLoading> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    //Fetch
    Future.delayed(Duration.zero, () {
      Provider.of<QuoteAppProvider>(
        context,
        listen: false,
      ).fetchQuotes(limit: widget.limit);
    });

    // Scroll listener for lazy loading
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 300) {
        final provider = Provider.of<QuoteAppProvider>(context, listen: false);
        if (!provider.isLoading && provider.hasMoreData) {
          provider.fetchQuotes(limit: widget.limit);
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<QuoteAppProvider>(
      builder: (context, provider, child) {

        if (provider.isLoading && provider.quotes.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.amber),
          );
        }

        return ListView.builder(
          controller: scrollController,
          itemCount: provider.quotes.length + (provider.hasMoreData ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < provider.quotes.length) {
              final quote = provider.quotes[index];
              return QuoteCard(
                id: '${quote.id}.',
                quote: '${quote.quote}',
                author: '~${quote.author}',
                userLiked: quote.userLiked,
                afterUserLiked: () => provider.afterUserLiked(quote),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: CircularProgressIndicator(color: Colors.amber),
                ),
              );
            }
          },
        );
      },
    );
  }
}

