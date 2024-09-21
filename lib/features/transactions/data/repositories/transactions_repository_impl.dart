import 'package:dartz/dartz.dart';
import 'package:qube/core/error/failures/qube_failure.dart';
import 'package:qube/features/transactions/data/datasources/transactions_datasource.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';
import 'package:qube/features/transactions/domain/repositories/transactions_repository.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final TransactionsDatasource dataSource;
  TransactionsRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<Either<QubeFailure, List<Transaction>>> loadTransactions({
    required int limit,
    required int offset,
    String? searchKeyword,
    int stepNumber = 1,
  }) async {
    try {
      return Right(
        await dataSource.loadTransactions(
          limit: limit,
          offset: offset,
          searchKeyword: searchKeyword,
          stepNumber: stepNumber,
        ),
      );
    } catch (e) {
      // TODO: Do something with exception here
      return Left(QubeFailure(
        errorMessage: e.toString(),
      ));
    }
  }

  @override
  Future<Either<QubeFailure, void>> moveToStepTwo({
    required String transactionId,
  }) async {
    try {
      return Right(
        await dataSource.moveToStepTwo(
          transactionId: transactionId,
        ),
      );
    } catch (e) {
      // TODO: Do something with exception here
      return Left(QubeFailure(
        errorMessage: e.toString(),
      ));
    }
  }
}
