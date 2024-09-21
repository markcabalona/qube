part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();

  @override
  List<Object> get props => [];
}

class LoadTransactionsEvent extends TransactionsEvent {
  final int limit;
  final int offset;
  final bool isInitialLoad;
  const LoadTransactionsEvent({
    this.limit = 10,
    this.offset = 0,
    this.isInitialLoad = false,
  });
}

class SearchTransactionsEvent extends TransactionsEvent {
  final String searchParam;
  const SearchTransactionsEvent({
    required this.searchParam,
  });
}

class MoveToStepTwoEvent extends TransactionsEvent {
  final String transactionId;
  const MoveToStepTwoEvent({
    required this.transactionId,
  });
}
