import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_step_state.dart';

enum TransactionStep {
  stepOne(0),
  stepTwo(1);

  final int value;
  const TransactionStep(this.value);
}

class TransactionStepCubit extends Cubit<TransactionStep> {
  TransactionStepCubit() : super(TransactionStep.stepOne);

  void goToStepOne() => emit(TransactionStep.stepOne);
  void goToStepTwo() => emit(TransactionStep.stepTwo);
}
