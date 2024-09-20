import 'package:equatable/equatable.dart';

class QubeUser extends Equatable {
  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  const QubeUser({
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [name, address, email, phoneNumber];
}

class Sender extends QubeUser {
  const Sender({
    required super.name,
    required super.address,
    required super.email,
    required super.phoneNumber,
  });
}

class Recipient extends QubeUser {
  const Recipient({
    required super.name,
    required super.address,
    required super.email,
    required super.phoneNumber,
  });
}
