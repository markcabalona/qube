import 'package:bloc/bloc.dart';
import 'package:qube/core/enums/transaction_step.dart';

class TransactionStepCubit extends Cubit<TransactionStep> {
  TransactionStepCubit() : super(TransactionStep.stepOne);

  void goToStepOne() => emit(TransactionStep.stepOne);
  void goToStepTwo() => emit(TransactionStep.stepTwo);
  void goToStep(TransactionStep step) => emit(step);
}
