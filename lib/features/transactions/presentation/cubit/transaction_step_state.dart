part of 'transaction_step_cubit.dart';

sealed class TransactionStepState extends Equatable {
  const TransactionStepState();

  @override
  List<Object> get props => [];
}

final class TransactionStepInitial extends TransactionStepState {}
