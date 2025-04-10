import 'package:flutter/material.dart';
import 'package:quotes_app/like_screen.dart';
import 'package:quotes_app/page_not_available.dart';
import 'package:quotes_app/quote_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Quotes App Home',
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
                const DifferentScreens(destinationScreen: null, emoji: '⭐', emojiText: 'Rating',),
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
  const DifferentScreens({super.key, required this.destinationScreen, required this.emoji, required this.emojiText});

  @override
  State<DifferentScreens> createState() => DifferentScreensState();
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
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              Text(
                widget.emojiText,
                style: TextStyle(
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
