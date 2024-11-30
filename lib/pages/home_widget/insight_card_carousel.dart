import 'package:flutter/material.dart';

class InsightCardCarousel extends StatefulWidget {
  const InsightCardCarousel({super.key});

  @override
  _InsightCardCarouselState createState() => _InsightCardCarouselState();
}

class _InsightCardCarouselState extends State<InsightCardCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160, // Adjust height based on your design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Number of cards
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue[50], // Light blue background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              width: 300, // Adjust width
              padding: const EdgeInsets.all(16), // Padding inside the card
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Icon
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons
                          .mail, // Replace with a custom image using Image.asset if needed
                      color: Colors.orange,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 12), // Spacing between icon and text
                  // Text Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TODAY",
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Financial Insights",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Your utility bill was \$120 this month, a 15% increase from last month.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12), // Smaller text
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Arrow Icon
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the PageController
    super.dispose();
  }
}
