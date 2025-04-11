import 'package:flutter/material.dart';
import 'package:quotes_app/api.dart';
import 'package:quotes_app/model.dart';

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
  List<QuoteDataModel> newQuotesToBeAdded = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMoreData = true;

  @override
  void initState() {
    super.initState();
    fetchQuotes();

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 300 && !isLoading && hasMoreData) {
        //print("User scrolled to: ${scrollController.position.pixels}");
        fetchQuotes();
      }
    });
  }

  Future<List<QuoteDataModel>> fetchQuotes() async {
    setState(() => isLoading = true);

    final newQuotes = await quoteAPI(page: currentPage, limit: widget.limit);

    setState(() {
      currentPage++;
      newQuotesToBeAdded.addAll(newQuotes);
      isLoading = false;
      if (newQuotes.length < widget.limit) {
        hasMoreData = false;
      }
    });

    return newQuotes;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (newQuotesToBeAdded.isEmpty && isLoading) {
      return Center(child: CircularProgressIndicator(color: Colors.amber));
    } else {
      return ListView.builder(
        controller: scrollController,
        itemCount: newQuotesToBeAdded.length + (hasMoreData ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < newQuotesToBeAdded.length) {
            final quote = newQuotesToBeAdded[index];
            return QuotesCards(
              quote: '${quote.quote}',
              author: '~${quote.author}',
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: CircularProgressIndicator(color: Colors.amber),
              ),
            );
          }
        },
      );
    }
  }
}

//Quotes card widget
class QuotesCards extends StatelessWidget {
  final String quote;
  final String author;

  const QuotesCards({super.key, required this.quote, required this.author});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          height: 200,
          width: MediaQuery.sizeOf(context).width * 0.93,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 7,
                color:Colors.black.withOpacity(0.8),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.black,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    quote,
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    author,
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: MediaQuery.sizeOf(context).width * 0.93,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
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
              IconButton(onPressed: () {},icon: const Icon(Icons.rate_review_outlined)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
