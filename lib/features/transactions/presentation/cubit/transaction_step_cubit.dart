import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qube/core/enums/transaction_step.dart';

class TransactionStepCubit extends Cubit<TransactionStep> {
  TransactionStepCubit() : super(TransactionStep.stepOne);

  void goToStepOne() => emit(TransactionStep.stepOne);
  void goToStepTwo() => emit(TransactionStep.stepTwo);
  void goToStep(TransactionStep step) => emit(step);
}
