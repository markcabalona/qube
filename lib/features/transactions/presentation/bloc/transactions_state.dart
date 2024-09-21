part of 'transactions_bloc.dart';

enum AppStatus { initial, loading, success, error, done }

class TransactionsState extends Equatable {
  final List<Transaction> transactions;
  final AppStatus status;
  final bool shouldFetchMore;
  final String? searchParam;
  const TransactionsState({
    this.transactions = const [],
    this.status = AppStatus.initial,
    this.shouldFetchMore = true,
    this.searchParam,
  });

  @override
  List<Object?> get props => [
        ...transactions,
        status,
        searchParam,
        shouldFetchMore,
      ];

  TransactionsState copyWith({
    List<Transaction>? transactions,
    AppStatus? status,
    bool? shouldFetchMore,
    ValueGetter<String?>? searchParam,
  }) {
    return TransactionsState(
      transactions: transactions ?? this.transactions,
      status: status ?? this.status,
      shouldFetchMore: shouldFetchMore ?? this.shouldFetchMore,
      searchParam: searchParam != null ? searchParam() : this.searchParam,
    );
  }
}
