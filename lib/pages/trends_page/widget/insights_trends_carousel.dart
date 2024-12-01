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
                      title: Text("Current Standing"),
                      subtitle: Text(
                        "The portfolio appears to have a primary focus on Malaysian assets, with some international diversification. The specific regional breakdown would need further details from the input to determine the extent of diversification.",
                      ),
                    ),
                    ListTile(
                      title: Text("Next Steps"),
                      subtitle: Text(
                        "Analyze the correlation between different geographic regions in the portfolio. Consider increasing exposure to regions with strong growth potential and low correlation with Malaysia to enhance diversification.",
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
    return SizedBox(
      height: 160, // Adjust height based on your design
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // First card
            GestureDetector(
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
                          padding: const EdgeInsets.all(
                              16), // Padding inside the card
                          child: const SingleChildScrollView(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Asset Class Section
                                Text(
                                  "Asset Class",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),

                                Section(
                                  title: "Current Standing",
                                  content:
                                      "The portfolio is heavily concentrated in equities (70%), specifically in the technology sector.  Moderate exposure to fixed income (20%) provides some stability, while the alternative investments (10%) offer diversification but lack detail on specific holdings.",
                                ),
                                Section(
                                  title: "Simulated Performance",
                                  content: '''
- Optimistic Scenario: Assuming continued growth in the tech sector and favorable economic conditions, the portfolio could see double-digit returns (12-15%) in the next year.
- A market downturn, particularly impacting the technology sector, could lead to significant losses (-10% to -15%). Rising interest rates could also negatively impact fixed-income returns.
- Under moderate growth assumptions, the portfolio is projected to return 5-7% annually.
              ''',
                                ),
                                Section(
                                  title: "Dynamic Adjustments",
                                  content:
                                      "Consider rebalancing the portfolio to reduce the concentration risk in equities, particularly technology stocks. Diversify within the alternatives category by exploring different asset classes like real estate or commodities.  Increase fixed-income allocation if risk tolerance changes.",
                                ),
                                Section(
                                  title: "Actionable Insights",
                                  content:
                                      "The heavy reliance on technology stocks presents a significant concentration risk. While potentially high-growth, this sector is also susceptible to volatility. Diversification across sectors and asset classes is crucial for long-term stability.",
                                ),
                                Section(
                                  title: "Next Steps",
                                  content:
                                      "Review individual technology holdings and assess their long-term prospects. Research potential alternative investments to broaden diversification. Consider a consultation to discuss adjusting the equity/fixed-income ratio based on your risk tolerance and financial goals.",
                                ),

                                SizedBox(height: 16.0),

                                // Geographic Asset Distribution Section
                                Text(
                                  "Geographic Asset Distribution",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                Section(
                                  title: "Current Standing",
                                  content:
                                      "The portfolio is primarily focused on Malaysian assets (80%), with some international exposure (20%). This limits diversification benefits and exposes the portfolio to Malaysian economic and political risks.",
                                ),
                                Section(
                                  title: "Simulated Performance",
                                  content: '''
- Moderate growth in Malaysia, coupled with global market stability, could yield moderate returns. However, the lack of geographic diversification limits upside potential.
- Optimistic Scenario: Continued growth in the Malaysian economy could benefit the portfolio, but international diversification would enhance returns in a global growth scenario.
- Pessimistic Scenario: Any downturn in the Malaysian economy would significantly impact the portfolio due to the high concentration. Limited international exposure restricts potential gains from other markets.
              ''',
                                ),
                                Section(
                                  title: "Dynamic Adjustments",
                                  content:
                                      "Increase international exposure to reduce reliance on the Malaysian market. Explore investment opportunities in developed and emerging markets to enhance diversification and potential returns.",
                                ),
                                Section(
                                  title: "Actionable Insights",
                                  content:
                                      "Concentrating assets primarily in Malaysia increases the portfolio's vulnerability to local market fluctuations.  Greater geographic diversification can mitigate this risk and potentially enhance returns by tapping into growth opportunities in other regions.",
                                ),
                                Section(
                                  title: "Next Steps",
                                  content:
                                      "Research international investment opportunities, particularly in regions with strong growth potential and different economic cycles than Malaysia. Consider ETFs or mutual funds for efficient international diversification.",
                                ),
                              ],
                            ),
                          ));
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
                    child: const Row(
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
                                "Investment",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "Current standing:\nThe portfolio is primarily focused on\nMalaysian assets (80%), with some...",
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.grey),
                                overflow:
                                    TextOverflow.ellipsis, // Avoid overflow
                              ),
                            ],
                          ),
                        ),

                        // Right: Three dots icon
                        Icon(Icons.more_vert, color: Colors.grey),
                      ],
                    ),
                  ),
                )),
            const SizedBox(width: 16), // Spacing between cards
            // Second card
            GestureDetector(
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
                          padding: const EdgeInsets.all(
                              16), // Padding inside the card
                          child: const SingleChildScrollView(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Asset Class Section
                                Text(
                                  "Insurance Analysis",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                Section(
                                  title: "Life Insurance",
                                  content: '''
- Analysis: Your current life insurance coverage of MYR 25,000.12 is likely insufficient. As a teacher with a dependent, your coverage should ideally be around 10-12 times your annual income to provide adequate financial security for your family in the event of your untimely demise.
- Recommendation: Consider increasing your life insurance coverage to at least MYR 384,000. Explore options like term life insurance for cost-effective coverage.
              ''',
                                ),
                                Section(
                                  title: "Health Insurance",
                                  content: '''
- Analysis: You have critical illness insurance with a coverage of MYR 20,000. This is a good start, but you should evaluate if this amount is sufficient to cover potential medical expenses, especially in a private healthcare setting in Malaysia. Consider the rising cost of healthcare in Malaysia and the potential long-term financial implications of a critical illness.
- Recommendation: Review your critical illness coverage and assess if it aligns with potential medical costs in Malaysia. Consider supplementing it with a comprehensive medical insurance plan to cover hospitalization and surgical expenses.
              ''',
                                ),
                                Section(
                                  title: "Auto Insurance",
                                  content: '''
- Analysis: No auto insurance information was provided. If you own a vehicle, auto insurance is legally required in Malaysia and essential for financial protection in case of accidents.
- Recommendation: If you own a vehicle, obtain comprehensive auto insurance that covers both your liability to others and damage to your own vehicle.
              ''',
                                ),
                                Section(
                                  title: "Other Insurance",
                                  content: '''
- Analysis: Your home insurance and personal accident insurance offer some protection, but the coverage amounts (MYR 5000 and MYR 5000 respectively) may need review. Consider the value of your home's contents and potential lost income due to an accident.
- Recommendation: Evaluate the adequacy of your home insurance coverage by assessing the replacement value of your belongings. Also, review your personal accident insurance coverage to ensure it adequately covers potential income loss due to disability resulting from an accident.
              ''',
                                ),
                                SizedBox(height: 16.0),

                                // Cost Analysis Section
                                Text(
                                  "Cost Analysis",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                Section(
                                  title: "Life Insurance",
                                  content: '''
The cost of your life insurance is not apparent from the data. However, ensure that the premiums are affordable and sustainable within your budget.
              ''',
                                ),
                                Section(
                                  title: "Health Insurance",
                                  content: '''
Evaluate the premiums for your critical illness insurance in relation to the coverage provided. Look for plans that offer comprehensive coverage at competitive rates.
              ''',
                                ),
                                Section(
                                  title: "Auto Insurance",
                                  content: '''
N/A
              ''',
                                ),
                                Section(
                                  title: "Other Insurance",
                                  content: '''
Assess the premiums for your home and personal accident insurance policies to ensure they are competitive while providing adequate coverage.
              ''',
                                ),
                                Section(
                                  title: "Discount Opportunities",
                                  content: '''
Explore potential discounts on your insurance premiums, such as bundling multiple policies with the same insurer, no-claim bonuses, or opting for online policy management.
              ''',
                                ),
                                Section(
                                  title: "Policy Review Schedule",
                                  content: '''
Review your insurance policies annually or whenever you experience a significant life event (e.g., marriage, childbirth, purchase of a new property) to ensure they continue to meet your evolving needs.
              ''',
                                ),
                              ],
                            ),
                          ));
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
                    child: const Row(
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
                                "Insurance",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "Analysis:\nYour current life insurance coverage of MYR 25,000.12 is likely insufficient. As a teacher with a...",
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.grey),
                                overflow:
                                    TextOverflow.ellipsis, // Avoid overflow
                              ),
                            ],
                          ),
                        ),

                        // Right: Three dots icon
                        Icon(Icons.more_vert, color: Colors.grey),
                      ],
                    ),
                  ),
                )),
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

class Section extends StatelessWidget {
  final String title;
  final String content;

  const Section({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            content,
            style: const TextStyle(fontSize: 14.0, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
