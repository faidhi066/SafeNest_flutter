import 'package:flutter/material.dart';

import '../../models/transactions.dart';

class TransactionTile extends StatelessWidget {
  final Transactions transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: transaction.isReceived ? Colors.blue : Colors.green,
        child: Icon(
          transaction.isReceived ? Icons.arrow_downward : Icons.arrow_upward,
          color: Colors.white,
        ),
      ),
      title: Text(transaction.name),
      subtitle: Text("${transaction.type} • ${transaction.date}"),
      trailing: Text(
        transaction.amount,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
