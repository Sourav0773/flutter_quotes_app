import 'package:flutter/material.dart';
import 'package:quotes_app/Screens/error_scrren.dart';
import 'package:quotes_app/Screens/favourite_screen.dart';
import 'package:quotes_app/Screens/comment_history_screen.dart';
import 'package:quotes_app/Screens/QuoteScreen/quote_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Quotes App',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.amber,
        toolbarHeight: 70,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 140),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DifferentScreens(destinationScreen: QuoteScreen(), emoji: '😊', emojiText: 'Happy Quotes',),
                const SizedBox(width: 22),
                const DifferentScreens(destinationScreen: LikeScreen(), emoji: '❤️', emojiText: 'Favourites',),
              ],
            ),

            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DifferentScreens(destinationScreen: HistoryScreen(), emoji: '⌛', emojiText: 'Comment History',),
                const SizedBox(width: 22),
                const DifferentScreens(destinationScreen: null, emoji: '🔗', emojiText: 'Share',),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

// Differnt page cards
class DifferentScreens extends StatefulWidget {
  final Widget? destinationScreen;
  final String emoji;
  final String emojiText;

  const DifferentScreens({
    super.key, 
    required this.destinationScreen, 
    required this.emoji, 
    required this.emojiText
  });

  @override
  State<DifferentScreens> createState(){
    return DifferentScreensState();
  } 
}

class DifferentScreensState extends State<DifferentScreens> {
  var isPressed = false;

  void navigateToScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => widget.destinationScreen ?? const PageNotAvailable(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: GestureDetector(
        onTap: () => navigateToScreen(),
        onTapUp: (val) {
          setState(() {
            isPressed = false;
          });
        },
        onTapDown: (val) {
          setState(() {
            isPressed = true;
          });
        },
        child: Container(
          width: 170,
          height: 170,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow:
                isPressed
                    ? [
                      const BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3, 3),
                        blurRadius: 5.0,
                        spreadRadius: 3,
                      ),
                    ]
                    : [
                      //default shadow
                      const BoxShadow(
                        color: Colors.black26,
                        offset: Offset(3, 3),
                        blurRadius: 5.0,
                        spreadRadius: 3.0,
                      ),
                    ],
          ),
          child: Column(
            children: [
              Text(
                widget.emoji,
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
              Text(
                widget.emojiText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center, 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
