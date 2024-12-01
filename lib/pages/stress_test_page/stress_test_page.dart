import 'package:flutter/material.dart';

import 'widget/stress_card.dart';

class StressTestPage extends StatefulWidget {
  const StressTestPage({super.key});

  @override
  _StressTestPageState createState() => _StressTestPageState();
}

class _StressTestPageState extends State<StressTestPage> {
  final List<Map<String, dynamic>> scenarios = [
    {"name": "Job Loss", "icon": Icons.work_off, "selected": false},
    {"name": "Market Crash", "icon": Icons.trending_down, "selected": false},
    {"name": "Interest Rate Spike", "icon": Icons.percent, "selected": false},
    {
      "name": "Unexpected Medical Exp.",
      "icon": Icons.local_hospital,
      "selected": false
    },
    {"name": "Housing Market Crash", "icon": Icons.house, "selected": false},
    {"name": "Inflation Surge", "icon": Icons.attach_money, "selected": false},
    {"name": "Divorce", "icon": Icons.family_restroom, "selected": false},
    {"name": "Natural Disaster", "icon": Icons.nature, "selected": false},
  ];

  void toggleSelection(int index) {
    if (mounted) {
      setState(() {
        scenarios[index]['selected'] = !scenarios[index]['selected'];
      });
    }
  }

  void showMoreInformation() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "More Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 13),
              Text(
                "Based on your selected scenarios, key areas that may be impacted include your income stability, increased debt repayment costs, reduced savings capacity, and higher day-to-day expenses.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Text(
            //   "Stress test your finances under various scenarios. Select situations that apply to understand your resilience and financial gaps.",
            //   style: TextStyle(fontSize: 16, color: Colors.black54),
            // ),
            const SizedBox(height: 20),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Select Scenarios",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8), // Spacing between text and icon
                Tooltip(
                  message:
                      "Select scenarios to personalize your stress test based on your current financial situation.",
                  child: Icon(
                    Icons.info_outline,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: scenarios.length,
                itemBuilder: (context, index) {
                  final scenario = scenarios[index];
                  return ScenarioCard(
                    title: scenario['name'],
                    imagePath: "assets/stress-test-image.png",
                    isSelected: scenario['selected'],
                    onSelect: () => toggleSelection(index),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final selectedScenarios = scenarios
                          .where((scenario) => scenario['selected'])
                          .map((e) => e['name'])
                          .toList();
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => AlertDialog(
                      //     title: const Text("Selected Scenarios"),
                      //     content: Text(selectedScenarios.isEmpty
                      //         ? "No scenarios selected."
                      //         : selectedScenarios.join(", ")),
                      //     actions: [
                      //       TextButton(
                      //         onPressed: () => Navigator.pop(context),
                      //         child: const Text("OK"),
                      //       ),
                      //     ],
                      //   ),
                      // );
                      Navigator.of(context).pushNamed("/stress_test_one");
                    },
                    child: const Text("Next - Personalize Details"),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final selectedCount =
                          scenarios.where((e) => e['selected']).length;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          selectedCount > 0
                              ? "Stress Test Running for $selectedCount Scenarios"
                              : "Please select at least one scenario.",
                        ),
                      ));
                      if (selectedCount > 0) {
                        Navigator.of(context).pushNamed("/stress_test_result");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.black54,
                    ),
                    child: const Text("Run Stress Test"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: showMoreInformation,
        child: const Icon(Icons.info),
      ),
    );
  }
}
