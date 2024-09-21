import 'package:dartz/dartz.dart';
import 'package:qube/core/error/failures/qube_failure.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';

abstract interface class TransactionsRepository {
  Future<Either<QubeFailure, List<Transaction>>> loadTransactions({
    required int limit,
    required int offset,
    String? searchKeyword,
  });
}
