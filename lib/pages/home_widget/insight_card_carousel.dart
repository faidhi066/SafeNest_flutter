import 'package:flutter/material.dart';

class InsightCardCarousel extends StatefulWidget {
  const InsightCardCarousel({super.key});

  @override
  _InsightCardCarouselState createState() => _InsightCardCarouselState();
}

class _InsightCardCarouselState extends State<InsightCardCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  final List<String> titles = [
    "Utility Bill Insights",
    "Smart Spending",
    "Portfolio Insights"
  ];

  final List<String> messages = [
    "Your utility bill was RM120 this month, a 15% increase from last month.",
    "Explore budget-friendly supermarkets near Taman Melati, KL and set spending limits for online shopping.",
    "Your portfolio is heavily concentrated in Malaysian equities."
  ];

  final List<IconData> icons = [
    Icons.lightbulb, // For "Utility Bill Insights"
    Icons.shopping_cart, // For "Smart Spending"
    Icons.pie_chart // For "Portfolio Insights"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160, // Adjust height based on your design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: titles.length, // Number of cards
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
                    child: Icon(
                      icons[index], // Use the icon for the current card
                      color: Colors.orange,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 12), // Spacing between icon and text
                  // Text Content
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle onTap actions here
                        print("Card ${index + 1} tapped!");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titles[index],
                            style: TextStyle(
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            messages[index],
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
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
