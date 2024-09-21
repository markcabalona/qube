import 'package:equatable/equatable.dart';

class QubeFailure<T> extends Equatable {
  final T? body;
  final String? errorMessage;

  const QubeFailure({
    this.body,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [body, errorMessage];
}
