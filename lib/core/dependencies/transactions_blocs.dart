import 'package:get_it/get_it.dart';
import 'package:qube/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:qube/features/transactions/presentation/cubit/transaction_step_cubit.dart';

void initializeTransactionsBlocs() {
  GetIt.instance.registerLazySingleton(
    () => TransactionsBloc(),
  );

  GetIt.instance.registerLazySingleton(
    () => TransactionStepCubit(),
  );
}
