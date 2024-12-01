import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DonutChartExample extends StatelessWidget {
  const DonutChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          // color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Smaller Donut Chart with Center Text
            SizedBox(
              height: 150, // Reduced height for a smaller chart
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      sections: _getChartSections(),
                      centerSpaceRadius: 55, // Adjusted to fit the smaller size
                      sectionsSpace: 1.5, // Reduced spacing between sections
                    ),
                  ),
                  const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Total Value",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "RM5,340.20",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // Legend
            const Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                LegendItem(color: Colors.red, label: "Rent"),
                LegendItem(color: Colors.blue, label: "Utilities"),
                LegendItem(color: Colors.purple, label: "Food"),
                LegendItem(color: Colors.teal, label: "Transport"),
                LegendItem(color: Colors.orange, label: "Groceries"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Generate smaller chart sections
  List<PieChartSectionData> _getChartSections() {
    return [
      PieChartSectionData(
        value: 30,
        color: Colors.red,
        radius: 30, // Reduced radius for a smaller chart
        title: '',
      ),
      PieChartSectionData(
        value: 25,
        color: Colors.blue,
        radius: 30,
        title: '',
      ),
      PieChartSectionData(
        value: 20,
        color: Colors.purple,
        radius: 30,
        title: '',
      ),
      PieChartSectionData(
        value: 15,
        color: Colors.teal,
        radius: 30,
        title: '',
      ),
      PieChartSectionData(
        value: 10,
        color: Colors.orange,
        radius: 30,
        title: '',
      ),
    ];
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          color: color,
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
