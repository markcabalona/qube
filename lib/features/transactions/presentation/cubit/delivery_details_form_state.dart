part of 'delivery_details_form_cubit.dart';

class DeliveryDetailsFormState extends Equatable {
  final Transaction transaction;
  final AppStatus status;
  final String name;
  final String email;
  final String phone;
  const DeliveryDetailsFormState({
    required this.transaction,
    this.status = AppStatus.initial,
    this.name = '',
    this.email = '',
    this.phone = '',
  });
  @override
  List<Object> get props => [
        status,
        name,
        email,
        phone,
        transaction,
      ];

  DeliveryDetailsFormState copyWith({
    AppStatus? status,
    String? name,
    String? email,
    String? phone,
  }) {
    return DeliveryDetailsFormState(
      transaction: transaction,
      status: status ?? this.status,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}
