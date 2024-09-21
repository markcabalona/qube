import 'package:get_it/get_it.dart';
import 'package:qube/core/enums/transaction_step.dart';
import 'package:qube/features/transactions/data/datasources/dummy_transactions_datasource.dart';
import 'package:qube/features/transactions/data/datasources/transactions_datasource.dart';
import 'package:qube/features/transactions/data/repositories/transactions_repository_impl.dart';
import 'package:qube/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:qube/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:qube/features/transactions/presentation/cubit/transaction_step_cubit.dart';

void initializeTransactionsBlocs() {
  GetIt.instance.registerLazySingleton<TransactionsDatasource>(
    () => DummyTransactionsDatasource(),
  );

  GetIt.instance.registerLazySingleton<TransactionsRepository>(
    () => TransactionsRepositoryImpl(
      dataSource: GetIt.instance(),
    ),
  );

  for (final element in TransactionStep.values) {
    GetIt.instance.registerLazySingleton(
      instanceName: element.name,
      () => TransactionsBloc(
        repository: GetIt.instance(),
        stepNumber: element.value + 1,
      ),
    );
  }

  GetIt.instance.registerLazySingleton(
    () => TransactionStepCubit(),
  );
}
