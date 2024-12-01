import 'package:flutter/material.dart';

import '../../services/db_service.dart';

class TransactionScreen extends StatefulWidget {
  final String userId;

  const TransactionScreen({super.key, required this.userId});

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final DBService dbService = DBService();
  List<Map<String, dynamic>> transactions = [];

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  Future<void> fetchTransactions() async {
    await dbService.connect(); // Connect to DB
    final results = await dbService.getTransactionList(widget.userId);

    setState(() {
      transactions = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("TRANSACTIONS:");
    // print(transactions);
    return Card(
      elevation: 4.0, // Add elevation for shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: SizedBox(
        height: 300, // Fixed height for the card

        child: transactions.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  // return ListTile(
                  //   title: Text('Amount: ${transaction['transaction_amount']}'),
                  // );
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          transaction['credit_debit_indicator'] == "DEBIT"
                              ? Colors.red
                              : Colors.green,
                      child: Icon(
                        transaction['credit_debit_indicator'] == "DEBIT"
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(transaction['merchant_name']),
                    subtitle: Text(
                        "${transaction['category']} • ${transaction['value_datetime'].toString().split(" ")[0]}\n${transaction['value_datetime'].toString().split(" ")[1].split('.')[0]}"),
                    trailing: Text(
                      "RM ${transaction['transaction_amount']}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
