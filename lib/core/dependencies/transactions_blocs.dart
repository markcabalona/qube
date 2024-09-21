import 'package:get_it/get_it.dart';
import 'package:qube/features/transactions/data/datasources/dummy_transactions_datasource.dart';
import 'package:qube/features/transactions/data/datasources/transactions_datasource.dart';
import 'package:qube/features/transactions/data/repositories/transactions_repository_impl.dart';
import 'package:qube/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:qube/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:qube/features/transactions/presentation/cubit/delivery_details_form_cubit.dart';
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

  GetIt.instance.registerLazySingleton(
    () => TransactionsBloc(
      repository: GetIt.instance(),
    ),
  );

  GetIt.instance.registerLazySingleton(
    () => TransactionStepCubit(),
  );
  GetIt.instance.registerLazySingleton(
    () => DeliveryDetailsFormCubit(),
  );
}
