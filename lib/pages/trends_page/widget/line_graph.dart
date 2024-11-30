import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineGraphWidget extends StatelessWidget {
  const LineGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> dataPoints = [
      const FlSpot(0, 3), // x=0, y=3
      const FlSpot(1, 2), // x=1, y=2
      const FlSpot(2, 5), // x=2, y=5
      const FlSpot(3, 3.5), // x=3, y=3.5
      const FlSpot(4, 4), // x=4, y=4
      const FlSpot(5, 6), // x=5, y=6
      const FlSpot(6, 5), // x=6, y=5
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.shade300,
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.grey.shade300,
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toString(),
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toString(),
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              left: BorderSide(color: Colors.black54, width: 1),
              bottom: BorderSide(color: Colors.black54, width: 1),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints,
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: true,
                color: Colors.blue.withOpacity(0.2),
              ),
            ),
          ],
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 7,
        ),
      ),
    );
  }
}
