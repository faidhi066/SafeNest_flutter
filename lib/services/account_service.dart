import 'package:flutter/material.dart';

import '../services/db_service.dart';

class AccountProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _accounts = [];
  List<Map<String, dynamic>> get accounts => _accounts;

  final DBService dbService = DBService();

  Future<void> loadAccounts() async {
    await dbService.connect();
    _accounts = await dbService.fetchAccounts();
    notifyListeners();
    await dbService.closeConnection();
  }
}
