import 'package:flutter/material.dart';

class StressTestDebtPage extends StatefulWidget {
  const StressTestDebtPage({super.key});

  @override
  State<StressTestDebtPage> createState() => _StressTestDebtPageState();
}

class _StressTestDebtPageState extends State<StressTestDebtPage> {
  final List<double> _savings = [3000]; // Stores user savings

  // Function to show a dialog for adding savings
  void _showAddDebtDialog() {
    final TextEditingController savingController = TextEditingController();

    showDialog(
      context: context, // Correct context parameter
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Debt"),
          content: TextField(
            controller: savingController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Enter debts amount",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close dialog
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (savingController.text.isNotEmpty) {
                  final saving = double.tryParse(savingController.text);
                  if (saving != null && saving > 0) {
                    setState(() {
                      _savings.add(saving); // Add saving to the list
                    });
                    Navigator.pop(context); // Close dialog
                  } else {
                    // Show error message for invalid input
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter a valid debt amount."),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: const Text(
          "Step 3/4",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personalize Details",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Stress test your finances under various scenarios. "
                    "Select situations that apply to understand your resilience and financial gaps.",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            // saving Section
            const Text(
              "debt",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),

            // List of savings
            if (_savings.isEmpty)
              const Text(
                "No debt added yet.",
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _savings.length,
                  itemBuilder: (context, index) {
                    print(_savings);

                    return ListTile(
                      leading:
                          const Icon(Icons.attach_money, color: Colors.green),
                      title: Text(
                        "Debt ${index + 1}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "RM ${_savings[index].toStringAsFixed(2)}",
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(
              height: 15,
            ),
            // Add saving Button
            Center(
              child: OutlinedButton.icon(
                onPressed: _showAddDebtDialog,
                icon: const Icon(Icons.add, color: Colors.black),
                label: const Text(
                  "Add Debt",
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  side: const BorderSide(color: Colors.black54),
                ),
              ),
            ),
            const Spacer(),

            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _savings.isEmpty
                    ? null // Disable button if no savings are added
                    : () {
                        // Handle next action
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //     content: Text("Proceeding to the next step!"),
                        //   ),
                        // );
                        Navigator.of(context).pushNamed("/stress_test_four");
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _savings.isEmpty
                      ? Colors.grey
                      : Colors.blue, // Change button color dynamically
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
