import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qube/core/enums/app_status.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';

part 'delivery_details_form_state.dart';

class DeliveryDetailsFormCubit extends Cubit<DeliveryDetailsFormState> {
  DeliveryDetailsFormCubit(Transaction transaction)
      : super(DeliveryDetailsFormState(
          transaction: transaction,
        ));

  void updateForm({
    String? name,
    String? email,
    String? phone,
  }) {
    emit(state.copyWith(
      name: name,
      email: email,
      phone: phone,
    ));
  }

  Future<void> submitForm() async {
    emit(state.copyWith(
      status: AppStatus.loading,
    ));
    await Future.delayed(
      Duration(
        milliseconds: Random().nextInt(2500),
      ),
    );
    emit(state.copyWith(
      status: AppStatus.success,
    ));
  }
}
