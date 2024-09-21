import 'package:qube/features/transactions/domain/entities/transaction.dart';

abstract interface class TransactionsDatasource {
  Future<List<Transaction>> loadTransactions({
    required int limit,
    required int offset,
    String? searchKeyword,
  });
}
