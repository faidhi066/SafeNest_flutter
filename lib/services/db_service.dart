import 'package:postgres/postgres.dart';

class DBService {
  late PostgreSQLConnection connection;

  // Initialize connection
  Future<void> connect() async {
    connection = PostgreSQLConnection(
      'ep-flat-band-a1icda59.ap-southeast-1.aws.neon.tech', // Replace with your database host
      5432, // Default Postgres port
      'neondb', // Replace with your database name
      username: 'neondb_owner', // Replace with your username
      password: 'CG4zi5OygUKb', // Replace with your password
      useSSL: true, // Enforces SSL
    );

    try {
      await connection.open();
      print('Database connected');
    } catch (e) {
      print('Database connection error: $e');
    }
  }

  // Fetch transaction amount
  Future<List<Map<String, dynamic>>> getTransactionList(String userId) async {
    try {
      final results = await connection.query(
        '''
        SELECT *
        FROM public.transactions 
        WHERE account_id = @userId
        ''',
        substitutionValues: {
          'userId': userId,
        },
      );

      return results.map((row) => row.toColumnMap()).toList();
    } catch (e) {
      print('Error fetching transaction amount: $e');
      return [];
    }
  }

  // Fetch user name
  Future<List<Map<String, dynamic>>> getUserName(String userId) async {
    try {
      final results = await connection.query(
        '''
        SELECT transaction_amount 
        FROM public.transactions 
        WHERE account_id = @userId
        ''',
        substitutionValues: {
          'userId': userId,
        },
      );

      return results.map((row) => row.toColumnMap()).toList();
    } catch (e) {
      print('Error fetching transaction amount: $e');
      return [];
    }
  }
}
