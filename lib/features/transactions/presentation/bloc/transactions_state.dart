part of 'transactions_bloc.dart';

class TransactionsState extends Equatable {
  final List<Transaction> transactions;
  final AppStatus status;
  final bool shouldFetchMore;
  final String? searchParam;
  final int stepNumber;
  const TransactionsState({
    this.transactions = const [],
    this.status = AppStatus.initial,
    this.shouldFetchMore = true,
    this.searchParam,
    required this.stepNumber,
  });

  @override
  List<Object?> get props => [
        ...transactions,
        status,
        searchParam,
        shouldFetchMore,
        stepNumber,
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
      stepNumber: stepNumber,
    );
  }
}
