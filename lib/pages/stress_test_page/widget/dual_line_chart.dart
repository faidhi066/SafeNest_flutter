import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

const result = {
  "stress_test_results": [
    {
      "id": 1,
      "user_id": 1,
      "stress_test_id": 1,
      "result": {
        "before_disaster": [
          {
            "month": "0",
            "savings": "11000.00",
            "investments": "15000.00",
            "income": "6000.00",
            "net_cash_flow": "1000.00"
          },
          {
            "month": "1",
            "savings": "13000.00",
            "investments": "15000.00",
            "income": "6000.00",
            "net_cash_flow": "1000.00"
          },
          {
            "month": "2",
            "savings": "15000.00",
            "investments": "15000.00",
            "income": "6000.00",
            "net_cash_flow": "1000.00"
          },
          {
            "month": "3",
            "savings": "17000.00",
            "investments": "15000.00",
            "income": "6000.00",
            "net_cash_flow": "1000.00"
          },
          {
            "month": "4",
            "savings": "19000.00",
            "investments": "15000.00",
            "income": "6000.00",
            "net_cash_flow": "1000.00"
          },
          {
            "month": "5",
            "savings": "21000.00",
            "investments": "15000.00",
            "income": "6000.00",
            "net_cash_flow": "1000.00"
          }
        ],
        "after_disaster": [
          {
            "month": "0",
            "savings": "10000.00",
            "investments": "15000.00",
            "income": "0",
            "net_cash_flow": "-5000.00"
          },
          {
            "month": "1",
            "savings": "5000.00",
            "investments": "15000.00",
            "income": "0",
            "net_cash_flow": "-5000.00"
          },
          {
            "month": "2",
            "savings": "0.00",
            "investments": "15000.00",
            "income": "0",
            "net_cash_flow": "-5000.00"
          },
          {
            "month": "3",
            "savings": "0",
            "investments": "10000.00",
            "income": "0",
            "net_cash_flow": "-5000.00"
          },
          {
            "month": "4",
            "savings": "0",
            "investments": "5000.00",
            "income": "0",
            "net_cash_flow": "-5000.00"
          },
          {
            "month": "5",
            "savings": "0",
            "investments": "0.00",
            "income": "0",
            "net_cash_flow": "-5000.00"
          }
        ]
      },
      "created_at": "2024-11-30T13:39:00.073407"
    }
  ]
};

class DualLineChart extends StatelessWidget {
  const DualLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Monthly Performance",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 150, // Reduced height for a smaller chart
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 20, // Adjusted for smaller height
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style:
                                const TextStyle(fontSize: 10), // Smaller font
                          );
                        },
                        interval: 1, // Show titles every 1 unit
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30, // Adjusted for smaller height
                        getTitlesWidget: (value, meta) {
                          // Customize Y-axis labels
                          switch (value.toInt()) {
                            case 0:
                              return const Text("0",
                                  style: TextStyle(fontSize: 10));
                            case 10000:
                              return const Text("10k",
                                  style: TextStyle(fontSize: 10));
                            case 20000:
                              return const Text("20k",
                                  style: TextStyle(fontSize: 10));
                            case 30000:
                              return const Text("30k",
                                  style: TextStyle(fontSize: 10));
                            case 40000:
                              return const Text("40k",
                                  style: TextStyle(fontSize: 10));
                            default:
                              return const Text("");
                          }
                        },
                        interval: 10000, // Show titles every 10k
                      ),
                    ),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 40000,
                  lineBarsData: [
                    // Under stress line
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 26000),
                        const FlSpot(1, 28000),
                        const FlSpot(2, 30000),
                        const FlSpot(3, 32000),
                        const FlSpot(4, 34000),
                        const FlSpot(5, 36000),
                      ],
                      isCurved: true,
                      color: Colors.red,
                      barWidth: 2, // Reduced line width for smaller chart
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                    // Normal scenario line
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 26000),
                        const FlSpot(1, 20000),
                        const FlSpot(2, 15000),
                        const FlSpot(3, 10000),
                        const FlSpot(4, 5000),
                        const FlSpot(5, 0)
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 2, // Reduced line width for smaller chart
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  lineTouchData: const LineTouchData(enabled: true),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LegendItem(color: Colors.red, label: "After Disaster"),
                SizedBox(width: 16),
                LegendItem(color: Colors.blue, label: "Before Disaster"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
