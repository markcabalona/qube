part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();

  @override
  List<Object> get props => [];
}

class LoadTransactionsEvent extends TransactionsEvent {
  final int limit;
  final int offset;
  const LoadTransactionsEvent({
    this.limit = 10,
    this.offset = 0,
  });
}

class SearchTransactionsEvent extends TransactionsEvent {
  final String searchParam;
  const SearchTransactionsEvent({
    required this.searchParam,
  });
}
