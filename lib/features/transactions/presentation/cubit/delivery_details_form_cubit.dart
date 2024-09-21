import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qube/core/enums/app_status.dart';

part 'delivery_details_form_state.dart';

class DeliveryDetailsFormCubit extends Cubit<DeliveryDetailsFormState> {
  DeliveryDetailsFormCubit() : super(const DeliveryDetailsFormState());

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
