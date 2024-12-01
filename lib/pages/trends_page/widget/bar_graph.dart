import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "December 2024",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "RM450 Spent",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Y-Axis with Dotted Lines and Bar Chart
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Y-Axis labels
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("200"),
                    SizedBox(height: 20),
                    Text("150"),
                    SizedBox(height: 20),
                    Text("100"),
                    SizedBox(height: 20),
                    Text("50"),
                    SizedBox(height: 20),
                    Text("0"),
                  ],
                ),
                const SizedBox(width: 8), // Space between Y-axis and chart

                // Bar Chart with Dotted Lines
                Expanded(
                  child: Stack(
                    children: [
                      // Dotted lines for Y-axis values
                      ..._buildDottedLines(),
                      // Bars
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildBar(40.0, "3rd"),
                          _buildBar(80.0, "9th"), // Higher bar
                          _buildBar(60.0, "16th"),
                          _buildBar(90.0, "30th"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static List<Widget> _buildDottedLines() {
    // Create dotted lines at each Y-axis value
    const List<double> positions = [0, 20, 40, 60, 80]; // Relative Y positions
    return positions.map((pos) {
      return Positioned(
        top: pos * 2, // Adjust scaling to match bar height (200 max)
        left: 0,
        right: 0,
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey[300]!,
                width: 0.5,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  static Widget _buildBar(double height, String label) {
    return Column(
      children: [
        // Bar
        SizedBox(
          width: 24.0,
          height: 100.0, // Total height for the bar container
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Background bar (grey)
              Container(
                width: 24.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              // Filled bar (purple)
              Container(
                width: 24.0,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        // Label for the date
        Text(
          label,
          style: const TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }
}
