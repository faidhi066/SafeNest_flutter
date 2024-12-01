import 'package:flutter/material.dart';

class TitleTextCard extends StatelessWidget {
  final String title;
  final String text;

  const TitleTextCard({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            builder: (context) {
              return Container(
                width: 300, // Adjust width
                padding: const EdgeInsets.all(16), // Padding inside the card
                child: ListView(
                  children: const [
                    ListTile(
                      title: Text("Next Steps"),
                      subtitle: Text(
                        "Analyze the correlation between different geographic regions in the portfolio. Consider increasing exposure to regions with strong growth potential and low correlation with Malaysia to enhance diversification.",
                      ),
                    ),
                    ListTile(
                      title: Text("Current Standing"),
                      subtitle: Text(
                        "The portfolio appears to have a primary focus on Malaysian assets, with some international diversification. The specific regional breakdown would need further details from the input to determine the extent of diversification.",
                      ),
                    ),
                    ListTile(
                      title: Text("Actionable Insights"),
                      subtitle: Text(
                        "The portfolio's performance is likely sensitive to fluctuations in the Malaysian market. International diversification is present but could be further enhanced to manage regional risks.",
                      ),
                    ),
                    ListTile(
                      title: Text("Dynamic Adjustments"),
                      subtitle: Text(
                        "Consider increasing international diversification to reduce reliance on the Malaysian market. Explore investment opportunities in emerging markets or specific regions with strong growth potential. The optimal geographic allocation depends on the investor's risk tolerance and investment goals.",
                      ),
                    ),
                    ListTile(
                      title: Text("Simulated Performance"),
                      subtitle: Text(
                        "Baseline: Under a baseline scenario, the portfolio is expected to experience moderate growth, with performance influenced by both Malaysian and global market conditions.\n\n"
                        "Optimistic: In an optimistic scenario for the Malaysian and global economies, the portfolio is expected to benefit from growth in both domestic and international markets. The degree of growth will depend on the specific geographic allocations.\n\n"
                        "Pessimistic: A pessimistic scenario, particularly one affecting the Malaysian economy or specific regions where the portfolio is invested, could lead to significant losses. International diversification may offer some downside protection.",
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Card(
          color: Colors.blue[50],
          margin: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            width: 340, // Adjust width
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align top of content
              children: [
                // Left: Title and description
                Expanded(
                  // Ensures the column doesn't exceed the available width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        text,
                        style:
                            const TextStyle(fontSize: 13.0, color: Colors.grey),
                        overflow: TextOverflow.ellipsis, // Avoid overflow
                      ),
                    ],
                  ),
                ),

                // Right: Three dots icon
                const Icon(Icons.more_vert, color: Colors.grey),
              ],
            ),
          ),
        ));
  }
}

class InsightTrendCarousel extends StatefulWidget {
  const InsightTrendCarousel({super.key});

  @override
  _InsightTrendCarouselState createState() => _InsightTrendCarouselState();
}

class _InsightTrendCarouselState extends State<InsightTrendCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 160, // Adjust height based on your design
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // First card
            TitleTextCard(
              title: "Investment",
              text:
                  "Current standing:\nThe portfolio is primarily focused on\nMalaysian assets (80%), with some...",
            ),
            SizedBox(width: 16), // Spacing between cards

            // Second card
            TitleTextCard(
              title: "Insurance",
              text: "This is the content of the second card.",
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the PageController
    super.dispose();
  }
}
