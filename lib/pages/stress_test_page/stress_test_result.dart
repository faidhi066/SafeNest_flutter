import 'package:fl_chart/fl_chart.dart'; // For pie chart
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'widget/stress_commitment_breakdown.dart'; // For circular percent indicator

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

class StressTestResult extends StatelessWidget {
  const StressTestResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Your Results",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Financial Resilience Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Financial Resilience",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "You have enough savings to last 4.5 months. Your job is stable and secure. Your DSR is conservative, and you have low expenditure appetite.",
                          style:
                              TextStyle(fontSize: 14.0, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 8.0,
                    percent: 0.65,
                    center: const Text(
                      "58%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    progressColor: Colors.purple,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            // Commitments Breakdown Section
            const StressCommitmentBreakdown(),
            const SizedBox(height: 24.0),

            // Mitigation Strategies Section
            Container(
              height: 1500.0, // Increased height to accommodate content
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Summary",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Your current financial resilience is moderate. You have a positive net cash flow and some savings, but your emergency fund is insufficient and your life insurance coverage needs improvement. Your investment portfolio is moderately diversified, but further optimization is possible. You are managing your spending reasonably well, but there's room for improvement in certain categories.",
                    style: TextStyle(fontSize: 12.0, color: Colors.black87),
                  ),
                  SizedBox(height: 16.0),

                  // Vulnerabilities
                  Text(
                    "Vulnerabilities",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "- Insufficient emergency fund to cover 3-6 months of essential expenses.\n"
                    "- Inadequate life insurance coverage to protect your dependent.\n"
                    "- Potential overspending on online shopping and food.\n"
                    "- Concentration of investments in the Malaysian market.",
                    style: TextStyle(fontSize: 12.0, color: Colors.black87),
                  ),
                  SizedBox(height: 16.0),

                  // Mitigation Strategies
                  Text(
                    "Mitigation Strategies",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),

                  // Emergency Fund Recommendation
                  Text(
                    "Emergency Fund:",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "Increase your emergency fund to cover at least 3-6 months of essential expenses. Aim for a target of MYR 9,600 to MYR 19,200 based on your MYR 3,200 monthly income. Consider high-yield savings accounts or fixed deposits with Malaysian banks like Maybank, CIMB, or Public Bank.",
                    style: TextStyle(fontSize: 12.0, color: Colors.black87),
                  ),
                  SizedBox(height: 8.0),

                  // Debt Management Recommendation
                  Text(
                    "Debt Management:",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "While your current debt level isn't specified, prioritize paying down any high-interest debt to improve your financial stability. Explore balance transfer options or debt consolidation if applicable.",
                    style: TextStyle(fontSize: 12.0, color: Colors.black87),
                  ),
                  SizedBox(height: 8.0),

                  // Insurance Recommendation
                  Text(
                    "Insurance:",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "Increase your life insurance coverage significantly. A coverage amount of 10-12 times your annual income (MYR 38,400 to MYR 46,080) would be more appropriate. Explore term life insurance for cost-effective coverage from providers like AIA, Prudential, or Great Eastern. Review your critical illness, home, and personal accident insurance coverage adequacy. Consider increasing coverage or adjusting plans to ensure sufficient protection.",
                    style: TextStyle(fontSize: 12.0, color: Colors.black87),
                  ),
                  SizedBox(height: 8.0),

                  // Investment Recommendation
                  Text(
                    "Investment:",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "Increase international diversification in your investment portfolio to reduce reliance on the Malaysian market. Explore investment opportunities in regions with strong growth potential through platforms like Rakuten Trade, FSMOne, or StashAway. Consider adding alternative investments like real estate or commodities based on your risk tolerance and financial goals. Regularly rebalance your portfolio to maintain the desired asset allocation.",
                    style: TextStyle(fontSize: 12.0, color: Colors.black87),
                  ),
                  SizedBox(height: 8.0),

                  // Spending Recommendation
                  Text(
                    "Spending:",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "Create a detailed budget and track your expenses diligently. Focus on optimizing grocery and online shopping expenses by comparing prices, using coupons, and planning purchases. Explore affordable dining options and consider cooking at home more frequently to reduce food costs.",
                    style: TextStyle(fontSize: 12.0, color: Colors.black87),
                  ),
                  SizedBox(height: 16.0),

                  // Benchmarking Analysis
                  Text(
                    "Benchmarking Analysis",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),

                  // Peer Group
                  Text(
                    "Peer Group:",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "Female teachers in Malaysia aged 30-35 with one dependent.",
                    style: TextStyle(fontSize: 12.0, color: Colors.black87),
                  ),
                  SizedBox(height: 8.0),

                  // Metrics
                  Text(
                    "Metrics:",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "- Emergency Fund (Months of Expenses Covered):\n  User Value: Less than 1\n  Peer Group Average: 6\n  Analysis: Your emergency fund is significantly below the average for your peer group. Aim to increase it to cover at least 3-6 months of expenses.\n\n"
                    "- Life Insurance Coverage (Multiple of Annual Income):\n  User Value: Less than 1\n  Peer Group Average: 10\n  Analysis: Your life insurance coverage is substantially lower than the average for your peer group. Consider increasing it to at least 10 times your annual income.\n\n"
                    "- Investment Portfolio Diversification:\n  User Value: Moderate\n  Peer Group Average: Moderate\n  Analysis: Your investment portfolio diversification is in line with your peer group. However, consider increasing international diversification to manage regional risks.",
                    style: TextStyle(fontSize: 12.0, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to generate pie chart sections
  List<PieChartSectionData> _getPieChartSections() {
    return [
      PieChartSectionData(
        color: Colors.red,
        value: 30,
        title: '',
        radius: 50,
      ),
      PieChartSectionData(
        color: Colors.blue,
        value: 25,
        title: '',
        radius: 50,
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 20,
        title: '',
        radius: 50,
      ),
      PieChartSectionData(
        color: Colors.purple,
        value: 15,
        title: '',
        radius: 50,
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: 10,
        title: '',
        radius: 50,
      ),
    ];
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const _LegendItem({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 12.0,
            height: 12.0,
            color: color,
          ),
          const SizedBox(width: 8.0),
          Text(
            text,
            style: const TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
