import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qube/core/enums/app_status.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';
import 'package:qube/features/transactions/domain/repositories/transactions_repository.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final TransactionsRepository _repository;
  TransactionsBloc({
    required TransactionsRepository repository,
    int stepNumber = 1,
  })  : _repository = repository,
        super(TransactionsState(stepNumber: stepNumber)) {
    on<LoadTransactionsEvent>(_loadTransactions);
    on<SearchTransactionsEvent>(_searchTransactions);
    on<MoveToStepTwoEvent>(_moveToStepTwo);
  }

  FutureOr<void> _loadTransactions(
    LoadTransactionsEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    if (state.status == AppStatus.loading) return;
    emit(state.copyWith(
      status: AppStatus.loading,
    ));

    final result = await _repository.loadTransactions(
      limit: event.limit,
      offset: event.isInitialLoad ? 0 : state.transactions.length,
      searchKeyword: state.searchParam,
      stepNumber: state.stepNumber,
    );

    result.fold(
      (l) => emit(state.copyWith(
        status: AppStatus.error,
      )),
      (transactions) => emit(state.copyWith(
        status: AppStatus.success,
        shouldFetchMore: transactions.length >= event.limit,
        transactions: event.isInitialLoad
            ? transactions
            : state.transactions + transactions,
      )),
    );
  }

  FutureOr<void> _searchTransactions(
    SearchTransactionsEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(
      state.copyWith(
        searchParam: () =>
            event.searchParam.isNotEmpty ? event.searchParam : null,
      ),
    );
    emit(state.copyWith(
      status: AppStatus.loading,
    ));
    final result = await _repository.loadTransactions(
      limit: 10,
      offset: 0,
      searchKeyword: event.searchParam,
      stepNumber: state.stepNumber,
    );

    result.fold(
      (l) => emit(state.copyWith(
        status: AppStatus.error,
      )),
      (transactions) => emit(state.copyWith(
        status: AppStatus.success,
        shouldFetchMore: transactions.length >= 10,
        transactions: transactions,
      )),
    );
  }

  FutureOr<void> _moveToStepTwo(
    MoveToStepTwoEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    final transactions = [...state.transactions];
    emit(state.copyWith(
      transactions: transactions
        ..removeWhere(
          (element) => element.id == event.transactionId,
        ),
    ));
    _repository.moveToStepTwo(
      transactionId: event.transactionId,
    );
  }
}
