import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(const TransactionsState()) {
    on<LoadTransactionsEvent>(_loadTransactions);
    on<SearchTransactionsEvent>(_searchTransactions);
  }

  FutureOr<void> _loadTransactions(
    LoadTransactionsEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    if (state.status == AppStatus.loading) return;
    emit(state.copyWith(
      status: AppStatus.loading,
    ));
    // TODO: load transactions
  }

  FutureOr<void> _searchTransactions(
    SearchTransactionsEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(
      state.copyWith(
        previousSearchParam: () =>
            event.searchParam.isNotEmpty ? event.searchParam : null,
      ),
    );
    emit(state.copyWith(
      status: AppStatus.loading,
    ));
    // TODO: Search transactions
  }
}
