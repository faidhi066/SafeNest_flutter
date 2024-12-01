import 'package:flutter/material.dart';

import 'donut_chart.dart';
import 'dual_line_chart.dart';

class StressCommitmentBreakdown extends StatefulWidget {
  const StressCommitmentBreakdown({super.key});

  @override
  _StressCommitmentBreakdownState createState() =>
      _StressCommitmentBreakdownState();
}

class _StressCommitmentBreakdownState extends State<StressCommitmentBreakdown> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350, // Adjust height based on your design
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // First card
            Card(
              color: Colors.blue[50],
              margin: const EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                width: 350, // Adjust width
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
                            "Commitments Breakdown",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          DonutChartExample(),
                        ],
                      ),
                    ),

                    // Right: Three dots icon
                    Icon(Icons.more_vert, color: Colors.grey),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16), // Spacing between cards

            // Second card
            Card(
              color: Colors.blue[50],
              margin: const EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                width: 350, // Adjust width
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
                            "Cashflow Runaway",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          DualLineChart(),
                        ],
                      ),
                    ),

                    // Right: Three dots icon
                    Icon(Icons.more_vert, color: Colors.grey),
                  ],
                ),
              ),
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
